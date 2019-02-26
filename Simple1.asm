#include p18f87k22.inc
;	
	extern	byte_reversal, init_chip_s, write_sequence_init, write_sequence, set_cs_high, read_sequence_init, read_sequence
	extern	SPI_MasterInit, SPI_MasterTransmit, SPI_MasterReceive
	extern  LCD_Setup, LCD_Write_Message, LCD_Clear_Screen, LCD_delay_ms, LCD_Second_Line, LCD_Write_Message_new, LCD_Send_Byte_D
	extern  LCD_Write_Hex
	extern	counter, address_count1, address_count2
	extern	ac1, ac2, ac3, ac_temp1, ac_temp2, ac_temp3, init_counter24bit, counter24bit
	extern  ADC_Setup, ADC_Read
	extern	LCD_delay_x4us
;	extern	mul_8x24, mul_16x16, mul_8x16, Mul_temp_1, Mul_temp_2, Mul_temp_3, Mul_temp_4, Mul_temp_5, Mul_temp_6	    ; external multiplication routines
;	extern	Mul_temp_A, Mul_temp_C, Mul_temp_B, Mul_temp_D, Mul_temp_E
;	extern  hex_to_dec, dec_1, dec_2, dec_3, dec_4
	extern	DAC_write, SPI_MasterInit2, SPI_MasterTransmit2, DAC_setup
	extern  keypad_setup, record_row, keypad_setup2, record_column, sumHandJ, keypad_LCD

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
;	movlw	0xFF
;	movwf	counter, 0
;	movlw	0x0A
;	movwf	address_count1, 0
;	movlw	0x18	
;	movwf	address_count2, 0
	call	LCD_Setup

;	call	keypad_setup
;	call	record_row
;	call	keypad_setup2
;	call	record_column
;	call	sumHandJ
;	movlw	0x0FF		    ; no. of ms delay
;	call	LCD_delay_ms
;	call	keypad_LCD
;	bra	start
	
	movlw 	0x03
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
	movlw	0x52
	call	LCD_Send_Byte_D
	call	SPI_MasterInit2
	bra	write

	
	
	
	
write
        nop
	nop
;	call	LCD_Clear_Screen
;	call	write_sequence_init
;	movlw	.1		; call a 4 microsecond delay
;	call	LCD_delay_x4us
	call	ADC_Read
	movf	ADRESH,W


	call	write_sequence	
;	call	LCD_Write_Hex

	movf	ADRESL, W

	
	call	write_sequence
;	call	LCD_Write_Hex


;	call	LCD_Second_Line	

;	call	ADC_Read
;	movf	ADRESH,W
;	movwf	Mul_temp_B
;	
;	call	ADC_Read
;	movf	ADRESL,W
;	movwf	Mul_temp_A		; define BA 16 bit to convert into decimal
;	
;	call	hex_to_dec
	

;	movf	dec_2, 0
;	call	LCD_Write_Hex

;	movf	dec_4, 0
;	call	LCD_Write_Hex	
	

;	movf	ac2, W
;	call	LCD_Write_Hex
	
;	movlw	0x03
;	movwf	delay_count
;	call	big_delay
;;	call	big_delay
;	call	LCD_Clear_Screen

;	goto	write

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
;	call	LCD_Second_Line
;	movf	ac3, 1, 0
;	call	LCD_Write_Hex
;	call	LCD_Clear_Screen
	
	nop
	nop
	nop
	call	counter24bit
;	call	counter24bit
	
;	incf	0x06, 1, 0
	movlw	0x00
	cpfseq	ac3, 0	
	bra	write
	cpfseq	ac2, 0
	bra	write
	cpfseq	ac1, 0	
	bra	write
	call	read
	
;	goto	$
read	
	call	LCD_Clear_Screen
	movlw	0x00
	movwf	TRISH, ACCESS
	call	read_sequence_init
;	call	DAC_setup
	movlw 	0x03
	movwf	ac1
	movlw	0xFF
	movwf	ac2
	movlw	0xFF
	movwf	ac3

	call	init_counter24bit
	
	movlw	0x50
	call	LCD_Send_Byte_D
	bra	read2
	
read2	;call	read_sequence
	;movwf	PORTH
;	movlw	0xAA
	;call	LCD_Write_Hex
	
;	movlw	0xFF
;	movwf	delay_count
;	call	big_delay
;	call	LCD_Clear_Screen
	
	
	call	DAC_write
	
	bra	read2
;	call	read_sequence
;	call	LCD_Write_Hex
	
	
	movlw	.1
	call	LCD_delay_x4us
	bra	read2
	call	counter24bit
;	call	counter24bit
;	incf	0x06, 1, 0

;	movf	ac2, W
;	call	LCD_Write_Hex
	
	movlw	0x00
	cpfseq	ac3, 0	
	bra	read2
	cpfseq	ac2, 0
	bra	read2
	cpfseq	ac1, 0	
	bra	read2	
	call	LCD_Clear_Screen			;	read
	bra	read2

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
