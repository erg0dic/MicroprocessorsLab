#include p18f87k22.inc
	

	    global  byte_reversal
	    
acs0	udata_acs
byte_to_reverse res 1   ; reserve 1 byte for each variable Mul_temp	
reversed_byte	res 1
byte_counter	res 1

finger  code
	
	
;start	
;	movlw	0x16
;	movwf	byte_to_reverse
;	call	byte_reversal
;	movwf	0x00	    
;	goto	end1
;start	;lfsr	FSR0, 0x300
;	movlw	0x01
;	movwf	0x10
;;	banksel PADCFG1			; PADCFG1 is not in Access Bank!!
;;	bsf	PADCFG1, REPU, BANKED	; PortE pull-ups on
;;	movlb	0x00			; set BSR back to Bank 0
;;	setf	TRISE			; Tri-state PortE (Set as input)
;
;	; setting appropriate address/control lines in PORTD to high
	
byte_reversal				; uses byte in W and reverses it
	movwf	byte_to_reverse	
	movlw	0x00
	movwf	reversed_byte		; initialize reversed_byte register
	movlw	0x08			 
	movwf	byte_counter		; counter to reverse a byte
	movlw	0x00			; make W 0 again
	call	reversing
	movf	reversed_byte, 0, 0		; move reversed byte to W
	return

reversing	
	rrcf	byte_to_reverse, 1, 0	    ; rotates the byte to the left and stores in byte_to_reserve
	addwfc	reversed_byte, 1, 0	    ; add the least significant bit to 0x00 in reversed byte  
	rlncf	reversed_byte, 1, 0
	decfsz	byte_counter, 1, 0
	call	reversing
	return   
;	

	
loop	call SPI_MasterInit
	movf	0x10,0, ACCESS
	
	call	SPI_MasterTransmit
	
;	movlw	0xff		    ; counter to delay more than 250 nanosec
;	movwf	0x40
;	call	clock


;	incf 	0x10, 1, ACCESS
	
;	movlw 	0xFF
;	cpfsgt 	0x10, ACCESS
	;bra 	loop		    ; Not yet finished goto start of loop again
	call	end1

SPI_MasterInit ; Set Clock edge to negative
	bcf	SSP2STAT, CKE	    ; MSSP enable; CKP=1; SPI master, clock=Fosc/64 (1MHz)
	movlw	(1<<SSPEN)|(1<<CKP)|(0x02)
	movwf	SSP2CON1		    ; SDO2 output; SCK2 output
	bcf	TRISD, SDO2		    ; PORTD4
	bcf	TRISD, SCK2		    ; PORTD6
	return
	
SPI_MasterTransmit ; Start transmission of data (held in W)
	movwf	SSP2BUF
Wait_Transmit ; Wait for transmission to complete
	btfss	PIR2, SSP2IF
	bra	Wait_Transmit
	bcf	PIR2, SSP2IF ; clear interrupt flag
	return
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
;	movlw 	0x0	
;	movwf	TRISD, ACCESS	    ; Set all ports in D to 0 but start incrementing only RD0, RD1, RD2, RD3 as 0E1, 0E2, Cp1, Cp2
;	movlw	0x0f
;	movwf	PORTD, ACCESS	
	
	
	
	;movwf	PORTD, ACCESS	    
;	bsf	PORTD, 0	    ; Set the specific positions in the ports to 1 (the 4 mentioned above)   ; 0E1
;	bsf	PORTD, 1		; 0E2
;	bsf	PORTD, 2		; CP1
;	bsf	PORTD, 3		; CP2

;	call	write_1			; can't do a read from chip 2 and write to chip one or vice versa at the same time RE: CAN NOW!
;	call	read_1
;	call	write_2
;	call	read_2
;	call	end1
;	
;	; writing a routine for reading data from PORTE 
;	
;read_1	movlw	0x01			    
;	subwf	PORTD,1, ACCESS		; set OE1 to low by substracting 1 from port D
;	movlw	0x0	    
;	movwf	TRISH, ACCESS		; set PORT H to output
;	clrf	PORTH			; clear register PORTE
;	movff	PORTE, PORTH		; output port E into port H 
;	movlw	0x01			
;	addwf	PORTD,1, ACCESS		; set OE1 to high again
;	return
;	
;read_2	movlw	0x02			; same as read 1 but for OE2
;	subwf	PORTD,1, ACCESS
;	movlw	0x0
;	movwf	TRISC, ACCESS
;	clrf	PORTC
;	movff	PORTE, PORTC
;	movlw	0x02
;	addwf	PORTD,1, ACCESS
;	return
;	
;write_1	clrf	TRISE
;	movlw	0x09		    ; input in E
;	movwf	LATE		    ; moved in LAT E
;	movlw	0x04		    ; change CP1 to low
;	subwf	PORTD,1,ACCESS		
;	movlw	0x14		    ; counter to delay more than 250 nanosec
;	movwf	0x40
;	call	clock
;	movlw	0x04
;	addwf	PORTD,1,ACCESS		    ; set clock pulse 1 back to high
;	setf	TRISE		    ; set PORTE as input
;	return
;	
;	
;write_2	clrf	TRISE
;	movlw	0x08		    ; input in E
;	movwf	LATE		    ; moved in LAT E
;	movlw	0x08		    ; change CP2 to low
;	subwf	PORTD,1,ACCESS		
;	movlw	0x14		    ; counter to delay more than 250 nanosec
;	movwf	0x40
;	call	clock
;	movlw	0x08
;	addwf	PORTD,1,ACCESS		    ; set clock pulse 1 back to high
;	setf	TRISE		    ; set PORTE as input
;	return
;	
;	
clock	decfsz	0x40		    ; decrement the decrement in FR 0x40
	bra	clock
	return		

end1    
	end
	
	
	
	
	
	
	
;	movlw	0x04
;	movwf	0x30
;	call	delay
	
	
;	org 0x0
;	goto	start
;	
;	org 0x100		    ; Main code starts here at address 0x100
;	
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
	
	


 ;   global  LCD_Setup, LCD_Write_Message, LCD_Write_Hex

;acs0    udata_acs   ; named variables in access ram
;LCD_cnt_l   res 1   ; reserve 1 byte for variable LCD_cnt_l
;LCD_cnt_h   res 1   ; reserve 1 byte for variable LCD_cnt_h
;LCD_cnt_ms  res 1   ; reserve 1 byte for ms counter
;LCD_tmp	    res 1   ; reserve 1 byte for temporary use
;LCD_counter res 1   ; reserve 1 byte for counting through nessage
;
;acs_ovr	access_ovr
;LCD_hex_tmp res 1   ; reserve 1 byte for variable LCD_hex_tmp	
;
;	constant    LCD_E=5	; LCD enable bit
;    	constant    LCD_RS=4	; LCD register select bit

;LCD	code
    
;F_Setup
;	m
;	movlw   b'11000000'	    ; RB0:5 all outputs
;	movwf	TRISB
;	movlw   .40
;	call	LCD_delay_ms	; wait 40ms for LCD to start up properly
;	movlw	b'00110000'	; Function set 4-bit
;	call	LCD_Send_Byte_I
;	movlw	.10		; wait 40us
;	call	LCD_delay_x4us
;	movlw	b'00101000'	; 2 line display 5x8 dot characters
;	call	LCD_Send_Byte_I
;	movlw	.10		; wait 40us
;	call	LCD_delay_x4us
;	movlw	b'00101000'	; repeat, 2 line display 5x8 dot characters
;	call	LCD_Send_Byte_I
;	movlw	.10		; wait 40us
;	call	LCD_delay_x4us
;	movlw	b'00001111'	; display on, cursor on, blinking on
;	call	LCD_Send_Byte_I
;	movlw	.10		; wait 40us
;	call	LCD_delay_x4us
;	movlw	b'00000001'	; display clear
;	call	LCD_Send_Byte_I
;	movlw	.2		; wait 2ms
;	call	LCD_delay_ms
;	movlw	b'00000110'	; entry mode incr by 1 no shift
;	call	LCD_Send_Byte_I
;	movlw	.10		; wait 40us
;	call	LCD_delay_x4us
;	return
;
;LCD_Write_Hex	    ; Writes byte stored in W as hex
;	movwf	LCD_hex_tmp
;	swapf	LCD_hex_tmp,W	; high nibble first
;	call	LCD_Hex_Nib
;	movf	LCD_hex_tmp,W	; then low nibble
;LCD_Hex_Nib	    ; writes low nibble as hex character
;	andlw	0x0F
;	movwf	LCD_tmp
;	movlw	0x0A
;	cpfslt	LCD_tmp
;	addlw	0x07	; number is greater than 9 
;	addlw	0x26
;	addwf	LCD_tmp,W
;	call	LCD_Send_Byte_D ; write out ascii
;	return
;	
;LCD_Write_Message	    ; Message stored at FSR2, length stored in W
;	movwf   LCD_counter
;LCD_Loop_message
;	movf    POSTINC2, W
;	call    LCD_Send_Byte_D
;	decfsz  LCD_counter
;	bra	LCD_Loop_message
;	return
;
;LCD_Send_Byte_I		    ; Transmits byte stored in W to instruction reg
;	movwf   LCD_tmp
;	swapf   LCD_tmp,W   ; swap nibbles, high nibble goes first
;	andlw   0x0f	    ; select just low nibble
;	movwf   LATB	    ; output data bits to LCD
;	bcf	LATB, LCD_RS	; Instruction write clear RS bit
;	call    LCD_Enable  ; Pulse enable Bit 
;	movf	LCD_tmp,W   ; swap nibbles, now do low nibble
;	andlw   0x0f	    ; select just low nibble
;	movwf   LATB	    ; output data bits to LCD
;	bcf	LATB, LCD_RS    ; Instruction write clear RS bit
;        call    LCD_Enable  ; Pulse enable Bit 
;	return
;
;LCD_Send_Byte_D		    ; Transmits byte stored in W to data reg
;	movwf   LCD_tmp
;	swapf   LCD_tmp,W   ; swap nibbles, high nibble goes first
;	andlw   0x0f	    ; select just low nibble
;	movwf   LATB	    ; output data bits to LCD
;	bsf	LATB, LCD_RS	; Data write set RS bit
;	call    LCD_Enable  ; Pulse enable Bit 
;	movf	LCD_tmp,W   ; swap nibbles, now do low nibble
;	andlw   0x0f	    ; select just low nibble
;	movwf   LATB	    ; output data bits to LCD
;	bsf	LATB, LCD_RS    ; Data write set RS bit	    
;        call    LCD_Enable  ; Pulse enable Bit 
;	movlw	.10	    ; delay 40us
;	call	LCD_delay_x4us
;	return
;
;LCD_Enable	    ; pulse enable bit LCD_E for 500ns
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	bsf	    LATB, LCD_E	    ; Take enable high
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	bcf	    LATB, LCD_E	    ; Writes data to LCD
;	return
;    
;; ** a few delay routines below here as LCD timing can be quite critical ****
;LCD_delay_ms		    ; delay given in ms in W
;	movwf	LCD_cnt_ms
;lcdlp2	movlw	.250	    ; 1 ms delay
;	call	LCD_delay_x4us	
;	decfsz	LCD_cnt_ms
;	bra	lcdlp2
;	return
;    
;LCD_delay_x4us		    ; delay given in chunks of 4 microsecond in W
;	movwf	LCD_cnt_l   ; now need to multiply by 16
;	swapf   LCD_cnt_l,F ; swap nibbles
;	movlw	0x0f	    
;	andwf	LCD_cnt_l,W ; move low nibble to W
;	movwf	LCD_cnt_h   ; then to LCD_cnt_h
;	movlw	0xf0	    
;	andwf	LCD_cnt_l,F ; keep high nibble in LCD_cnt_l
;	call	LCD_delay
;	return
;
;LCD_delay			; delay routine	4 instruction loop == 250ns	    
;	movlw 	0x00		; W=0
;lcdlp1	decf 	LCD_cnt_l,F	; no carry when 0x00 -> 0xff
;	subwfb 	LCD_cnt_h,F	; no carry when 0x00 -> 0xff
;	bc 	lcdlp1		; carry, then loop again
;	return			; carry reset so return


;    end

