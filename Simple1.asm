#include p18f87k22.inc
;	
	extern	byte_reversal, init_chip_s, write_sequence_init, write_sequence, set_cs_high, read_sequence_init, read_sequence
	extern	SPI_MasterInit, SPI_MasterTransmit, SPI_MasterReceive
	extern  LCD_Setup, LCD_Write_Message, LCD_Clear_Screen, LCD_delay_ms, LCD_Second_Line, LCD_Write_Message_new, LCD_Send_Byte_D
	extern  LCD_Write_Hex
	extern	counter, address_count1, address_count2
	extern	ac1, ac2, ac3, ac_temp1, ac_temp2, ac_temp3, init_counter24bit, counter24bit
	extern  ADC_Setup, ADC_Read
	
acs0	udata_acs
delay_count	res 1	
	
;	global	SPI_MasterInit, SPI_MasterTransmit, Wait_Transmit, SPI_MasterReceive, Wait_read
	
	code
	org 0x0
	goto	start
;	
	org 0x100		    ; Main code starts here at address 0x100
;	
start	nop
	movlw	0xFF
	movwf	counter, 0
	movlw	0x0A
	movwf	address_count1, 0
	movlw	0x18	
	movwf	address_count2, 0
	call	LCD_Setup

	movlw 	0x07
	movwf	ac1
	movlw	0xFF
	movwf	ac2
	movlw	0xFF
	movwf	ac3

	call	init_counter24bit
	
	call	ADC_Setup  ; initialize ADC
	
; add ADC code where appropriate
;	call	ADC_Read
;	movf	ADRESH,W
;	movwf	Mul_temp_B
;	
;	call	ADC_Read
;	movf	ADRESL,W
	
;lfsr	FSR0, 0x30
;	movlw	0x11
;	call	byte_reversal
;	movwf	0x00
	call	write_sequence_init
	bra	write

	
;start	lfsr	FSR0, 0x300	    ; load address 0x100 into fsr0
;
;	movlw 	0x0	
;	movwf	TRISC, ACCESS	    ; Port C all outputs
;	bra 	test
;loop	movff 	0x06, PORTC
;	movff	0x06, POSTINC0	    ; moves counter into FSR0 address 0x300 onwards (incremented by one successively)
;	movlw	0x04
;	movwf	0x30
;	call	delay		    ; delay routine
;	incf 	0x06, W, ACCESS
;	
;	
;test	movwf	0x06, ACCESS	    ; Test for end of loop condition
;	movlw 	0x1F
;	cpfsgt 	0x06, ACCESS
;	bra 	loop		    ; Not yet finished goto start of loop again
;	goto 	check		    ; Re-run program from start
 
;delay	movlw	0xF3		    ; initialize .03 in W 
;	movwf	0x40		    ; pass .03 to register 0x40
;	call	delay1
;	decfsz	0x30		    ; decrement the number in FR 0x30
;	bra	delay
;	return	
;
;delay1	decfsz	0x40		    ; decrement the decrement in FR 0x40
;	bra	delay1
;	return

;check	lfsr	FSR1, 0x302	    ; load address 0x100 into fsr1
;	movlw	0x0
;	movwf	TRISD, ACCESS
;	bra	check_test
;
;; subroutine uses FSR1 to go through incrementing numbers and outputs a flashing light in PORTD if different
;check_loop	
;	movf	0x07, W		    ; move counter value in 0x07 into W
;	subwf	INDF1, f	    ; substracts counter value in W from 0x300 and onwards and changes value of 0x300 onwards
;	movff	POSTINC1, PORTD	    ; outputs value in FSR1 to PORTD
;	incf 	0x07, W, ACCESS	    ; counter increments
;	
;check_test
;	movwf	0x07, ACCESS	    ; Test for end of loop condition
;	movlw 	0x1F		    ; counter length
;	cpfsgt 	0x07, ACCESS
;	bra 	check_loop	    ; Not yet finished goto start of loop again
;	goto	0x0		    ; go to start 
		
	

	
	
	
	
write
	
        nop
	nop
;	call	write_sequence_init
	call	write_sequence
;	call	read_sequence_init
;	movlw	0x00
;	movwf	TRISH, ACCESS
;	movlw	0x12
;	movwf	PORTH, ACCESS
;	goto	$
;	call	read_sequence
;	goto	$
;	call	read_sequence_init
;	call	read_sequence

;	decfsz	address_count1, 1, 0
	call	counter24bit
;	incf	0x06, 1, 0
	movlw	0x00
	cpfseq	ac3, 0	
	bra	write
	cpfseq	ac2, 0
	bra	write
	cpfseq	ac1, 0	
	bra	write	
	call	read
	

read	
	movlw	0x00
	movwf	TRISH, ACCESS
	call	read_sequence_init

read2	call	read_sequence
	movwf	PORTH
;	movlw	0xAA
	call	LCD_Write_Hex
	movlw	0xFF
	movwf	delay_count
	call	big_delay
	call	LCD_Clear_Screen
	
	
	bra	read2	    ;	read

;;	banksel PADCFG1			; PADCFG1 is not in Access Bank!!
;;	bsf	PADCFG1, REPU, BANKED	; PortE pull-ups on
;;	movlb	0x00			; set BSR back to Bank 0
;;	setf	TRISE			; Tri-state PortE (Set as input)
;
;	; setting appropriate address/control lines in PORTD to high
;	
;
;	
;
;	
;loop	call SPI_MasterInit
;	movf	0x10,0, ACCESS
;	
;	;call	SPI_MasterTransmit
;	
;;	movlw	0xff		    ; counter to delay more than 250 nanosec
;;	movwf	0x40
;;	call	clock
;
;
;;	incf 	0x10, 1, ACCESS
;	
;;	movlw 	0xFF
;;	cpfsgt 	0x10, ACCESS
;	;bra 	loop		    ; Not yet finished goto start of loop again
;	call	end1

;SPI_MasterInit ; Set Clock edge to negative
;	bcf	SSP1STAT, CKE	    ; MSSP enable; CKP=1; SPI master, clock=Fosc/64 (1MHz)
;	movlw	(1<<SSPEN)|(1<<CKP)|(0x02)
;	movwf	SSP1CON1		    ; SDO2 output; SCK2 output
;	bcf	TRISC, SDO1		    ; PORTC5
;	bcf	TRISC, SCK1		    ; PORTC3
;	bsf	TRISC, SDI1		    ; PORTC4	
;	return
;	
;SPI_MasterTransmit ; Start transmission of data (held in W)
;	movwf	SSP1BUF
;Wait_Transmit ; Wait for transmission to complete
;	btfss	PIR1, SSP1IF
;	bra	Wait_Transmit
;	bcf	PIR1, SSP1IF ; clear interrupt flag
;	return
;		
;
;;SPI_MasterInitReceive ; Set Clock edge to negative
;;	bcf	SSP1STAT, CKE	    ; MSSP enable; CKP=1; SPI master, clock=Fosc/64 (1MHz)
;;	movlw	(1<<SSPEN)|(1<<CKP)|(0x02)
;;	movwf	SSP1CON1		    ; SDO2 output; SCK2 output
;;	bsf	TRISC, SDI1		    ; PORTC4
;;	bcf	TRISC, SCK1		    ; PORTC3
;;	return
;	
;	
;	
;	
;SPI_MasterReceive
;;	movf	SSP1BUF, 0, 1		; receive data transmission
;	bra	Wait_read
;	movf	SSP1BUF, 0, 0		; receive data transmission in W
;	return
;Wait_read ; Wait for transmission to complete
;	btfss	PIR1, SSP1IF
;	bra	Wait_read
;	bcf	PIR1, SSP1IF ; clear interrupt flag
;	return	
;	

;	
;	
;	
;	
;	
;	
;	
;	
;	
;	
;	
;	
;	
;	
;	
;;	movlw 	0x0	
;;	movwf	TRISD, ACCESS	    ; Set all ports in D to 0 but start incrementing only RD0, RD1, RD2, RD3 as 0E1, 0E2, Cp1, Cp2
;;	movlw	0x0f
;;	movwf	PORTD, ACCESS	
;	
;	
;	
;	;movwf	PORTD, ACCESS	    
;;	bsf	PORTD, 0	    ; Set the specific positions in the ports to 1 (the 4 mentioned above)   ; 0E1
;;	bsf	PORTD, 1		; 0E2
;;	bsf	PORTD, 2		; CP1
;;	bsf	PORTD, 3		; CP2
;
;;	call	write_1			; can't do a read from chip 2 and write to chip one or vice versa at the same time RE: CAN NOW!
;;	call	read_1
;;	call	write_2
;;	call	read_2
;	call	end1
;;	
;;	; writing a routine for reading data from PORTE 
;;	
;;read_1	movlw	0x01			    
;;	subwf	PORTD,1, ACCESS		; set OE1 to low by substracting 1 from port D
;;	movlw	0x0	    
;;	movwf	TRISH, ACCESS		; set PORT H to output
;;	clrf	PORTH			; clear register PORTE
;;	movff	PORTE, PORTH		; output port E into port H 
;;	movlw	0x01			
;;	addwf	PORTD,1, ACCESS		; set OE1 to high again
;;	return
;;	
;;read_2	movlw	0x02			; same as read 1 but for OE2
;;	subwf	PORTD,1, ACCESS
;;	movlw	0x0
;;	movwf	TRISC, ACCESS
;;	clrf	PORTC
;;	movff	PORTE, PORTC
;;	movlw	0x02
;;	addwf	PORTD,1, ACCESS
;;	return
;;	
;;write_1	clrf	TRISE
;;	movlw	0x09		    ; input in E
;;	movwf	LATE		    ; moved in LAT E
;;	movlw	0x04		    ; change CP1 to low
;;	subwf	PORTD,1,ACCESS		
;;	movlw	0x14		    ; counter to delay more than 250 nanosec
;;	movwf	0x40
;;	call	clock
;;	movlw	0x04
;;	addwf	PORTD,1,ACCESS		    ; set clock pulse 1 back to high
;;	setf	TRISE		    ; set PORTE as input
;;	return
;;	
;;	
;;write_2	clrf	TRISE
;;	movlw	0x08		    ; input in E
;;	movwf	LATE		    ; moved in LAT E
;;	movlw	0x08		    ; change CP2 to low
;;	subwf	PORTD,1,ACCESS		
;;	movlw	0x14		    ; counter to delay more than 250 nanosec
;;	movwf	0x40
;;	call	clock
;;	movlw	0x08
;;	addwf	PORTD,1,ACCESS		    ; set clock pulse 1 back to high
;;	setf	TRISE		    ; set PORTE as input
;;	return
;;	
;;	
;clock	decfsz	0x40		    ; decrement the decrement in FR 0x40
;	bra	clock
;	return		
;

;	
;	
;	
big_delay
	
	movf	delay_count, 0
	call	LCD_delay_ms
	return
	
end1    
	end	
	
;;	movlw	0x04
;;	movwf	0x30
;;	call	delay
;	
;	
;;	org 0x0
;;	goto	start
;;	
;;	org 0x100		    ; Main code starts here at address 0x100
;;	
;;start	lfsr	FSR0, 0x300	    ; load address 0x100 into fsr0
;;
;;	movlw 	0x0	
;;	movwf	TRISC, ACCESS	    ; Port C all outputs
;;	bra 	test
;;loop	movff 	0x06, PORTC
;;	movff	0x06, POSTINC0	    ; moves counter into FSR0 address 0x300 onwards (incremented by one successively)
;;	movlw	0x04
;;	movwf	0x30
;;	call	delay		    ; delay routine
;;	incf 	0x06, W, ACCESS
;;	
;;	
;;test	movwf	0x06, ACCESS	    ; Test for end of loop condition
;;	movlw 	0x1F
;;	cpfsgt 	0x06, ACCESS
;;	bra 	loop		    ; Not yet finished goto start of loop again
;;	goto 	check		    ; Re-run program from start
; 
;;delay	movlw	0xF3		    ; initialize .03 in W 
;;	movwf	0x40		    ; pass .03 to register 0x40
;;	call	delay1
;;	decfsz	0x30		    ; decrement the number in FR 0x30
;;	bra	delay
;;	return	
;;
;;delay1	decfsz	0x40		    ; decrement the decrement in FR 0x40
;;	bra	delay1
;;	return
;
;;check	lfsr	FSR1, 0x302	    ; load address 0x100 into fsr1
;;	movlw	0x0
;;	movwf	TRISD, ACCESS
;;	bra	check_test
;;
;;; subroutine uses FSR1 to go through incrementing numbers and outputs a flashing light in PORTD if different
;;check_loop	
;;	movf	0x07, W		    ; move counter value in 0x07 into W
;;	subwf	INDF1, f	    ; substracts counter value in W from 0x300 and onwards and changes value of 0x300 onwards
;;	movff	POSTINC1, PORTD	    ; outputs value in FSR1 to PORTD
;;	incf 	0x07, W, ACCESS	    ; counter increments
;;	
;;check_test
;;	movwf	0x07, ACCESS	    ; Test for end of loop condition
;;	movlw 	0x1F		    ; counter length
;;	cpfsgt 	0x07, ACCESS
;;	bra 	check_loop	    ; Not yet finished goto start of loop again
;;	goto	0x0		    ; go to start 
;	
;	
