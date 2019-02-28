#include p18f87k22.inc
    
    global  init_chip_s, write_sequence_init, write_sequence, set_cs_high, read_sequence_init, read_sequence 
    global  SPI_MasterInit, SPI_MasterInit2, SPI_MasterTransmit2, SPI_MasterTransmit, SPI_MasterReceive
    global  counter, address_count1, address_count2
    global  DAC_write, DAC_setup
    extern  LCD_delay_ms, LCD_delay_x4us 
    
acs0	udata_acs
counter	    res 1
address_count1	res 1
address_count2	res 1
config_reg	res 1
temp_reg_1	res 1    
memory_interface    code

   
    
init_chip_s
	movlw	b'11111101'		    ; set RE1 tris to low so its the only output
	movwf	TRISE
	movlw	b'00000010'		    ; set RE1 to high and call a delay
	movwf	PORTE
	movlw	.1
	call	LCD_delay_ms	
	movlw   0x00	    ; set RE1 to low
	movwf	PORTE
	return

;set_cs_low
;	movlw	b'11111101'		    ; set RE1 tris to low so its the only output
;	movwf	TRISE
;	movlw	0x00			    ; set RE1 to high and call a delay
;	movwf	PORTE	

set_cs_high
	bcf	TRISE, 1		    ; set RE1 tris to low so its the only output
	bsf	PORTE, 1			    ; set RE1 to high and call a delay	
	return
	
write_sequence_init
;	movlw	b'11011111'		    ; set RC5 tris to low so its the only output
;	movwf	TRISC	
;			; call parallel to serial conversion on port RC5
	
	call	init_chip_s
	movlw	b'00000010'		    ; set RE1 to high and call a delay
	movwf	PORTE
	
	call	SPI_MasterInit
	
	call	init_chip_s
	movlw	b'00000110'		; Set write enable latch opcode to initialize writing into the external memory	
	call	SPI_MasterTransmit	; send serial data

;	call	set_cs_high
	
	call	init_chip_s   
	movlw	b'00000010'		; write sequence starter
	call	SPI_MasterTransmit
	
	
	movlw	0x00				;call	address where to store this is on memory
	call	SPI_MasterTransmit
	movlw	0x00				
	call	SPI_MasterTransmit
	movlw	0x00				
	call	SPI_MasterTransmit
	
	return
	
write_sequence			; assumes a write sequence has been initialized
;	movf	counter, 0, 0		; check
;	dcfsnz	counter, 1, 0
;	call	reset_counter
	
	
;	movlw	0xAA
	call	SPI_MasterTransmit	; serial it and send it to external memory
	
;	call	set_cs_high		; terminate the write sequence
	return	
	
read_sequence_init
;	movlw	b'11011111'		    ; set RC5 tris to low so its the only output
;	movwf	TRISC	
			; call parallel to serial conversion on port RC5
	call	init_chip_s
	movlw	b'00000010'		    ; set RE1 to high and call a delay
	movwf	PORTE
			
	call	SPI_MasterInit
	
	call	init_chip_s
	movlw	b'00000011'		; Set write enable latch opcode to initialize writing into the external memory	
	call	SPI_MasterTransmit	; send serial data i.e. the READ opcode in serial form
	


	movlw	0x00				;call	address where to store this is on memory
	call	SPI_MasterTransmit
	movlw	0x00				
	call	SPI_MasterTransmit
	movlw	0x00				

	call	SPI_MasterTransmit
;	call	SPI_MasterReceive
;	call	SPI_MasterInitReceive		; initialize the SPI to read data
	return	

read_sequence		    ; assumes the read and read sequence is initialized
	call	SPI_MasterReceive	    ; stores read byte in W
;	movwf	0xA10, ACCESS
;	movlw	0x00
;	movwf	TRISH, ACCESS
;	movff	0xA10, PORTH
;	call	set_cs_high		; terminate read
	return
	
SPI_MasterInit ; Set Clock edge to negative
	bcf	SSP1STAT, CKE	    ; MSSP enable; CKP=1; SPI master, clock=Fosc/64 (1MHz)
	movlw	(1<<SSPEN)|(1<<CKP)|(0x02)
	movwf	SSP1CON1		    ; SDO2 output; SCK2 output
	bcf	TRISC, SDO1		    ; PORTC5
	bcf	TRISC, SCK1		    ; PORTC3
	bsf	TRISC, SDI1		    ; PORTC4	
	return
	
SPI_MasterTransmit ; Start transmission of data (held in W)
	movwf	SSP1BUF
Wait_Transmit ; Wait for transmission to complete
	btfss	PIR1, SSP1IF
	bra	Wait_Transmit
	bcf	PIR1, SSP1IF ; clear interrupt flag
	return	

	

SPI_MasterReceive
	movlw	0x00
	movwf	SSP1BUF		; receive data transmission
;	movf	SSP1BUF, 0, 0		; receive data transmission in W
;	return
Wait_read ; Wait for transmission to complete
;	BTFSS SSP1STAT, BF ;Has data been received (transmit complete)?
;	bra	Wait_read
;	MOVF	SSP1BUF, 0
	
	btfss	PIR1, SSP1IF
	bra	Wait_read
	movlw	0x00
	movwf	TRISF
	movlw	b'00100000'
	movwf	PORTF
	bcf	PORTF, 5    
	bcf	PIR1, SSP1IF ; clear interrupt flag
	movf	SSP1BUF , 0, 0
	movwf	PORTH
	return		
	
	
reset_counter
	movlw	0xFF
	movwf	counter, 0
	return
    
    
SPI_MasterInit2 ; Set Clock edge to negative
	bsf	SSP2STAT, CKE	    ; MSSP enable; CKP=1; SPI master, clock=Fosc/64 (1MHz)
	movlw	(1<<SSPEN)|(0x02)
	movwf	SSP2CON1		    ; SDO2 output; SCK2 output
	bcf	TRISD, SDO2		    ; PORTD4
	bcf	TRISD, SCK2		    ; PORTD6
;	bsf	TRISC, SDI1		    ; PORTC4	
	return
	
SPI_MasterTransmit2 ; Start transmission of data (held in W)
	movwf	SSP2BUF
Wait_Transmit2 ; Wait for transmission to complete
	btfss	PIR2, SSP2IF
	bra	Wait_Transmit2
	bcf	PIR2, SSP2IF ; clear interrupt flag
	return    
        

DAC_setup
;	bcf	TRISE, 3	    ; set LDAC high
;	bsf	PORTE, 3
;	
;	bcf	TRISE, 2	    ; set RE2 as Chip select CS
;	bsf	PORTE, 2	    ; set RE2 high
;;	movlw	.1
;;	call	LCD_delay_x4us	

DAC_write
	bcf	TRISE, 3	    ; set LDAC high
	bsf	PORTE, 3
	
	bcf	TRISE, 2	    ; set RE2 as Chip select CS
	bsf	PORTE, 2	    ; set RE2 high
	movlw	.3
	call	LCD_delay_x4us		
	
	
	

	bcf	PORTE, 2	    ; set CS low
	

	
	
	movlw	b'00010000'	    ; configuration bits in W
	movwf	config_reg
	
	call	read_sequence	    ; load right justified adc bits in W
;	movlw	b'00001111'
	addwf	config_reg, 1, 0    ; store high (config) and low nibble (data) ADDRESH high value

	call	read_sequence
;	movlw	b'11111111'	
	addwf	temp_reg_1, 1, 0
	
	movf	config_reg, 0, 0
	call	SPI_MasterTransmit2	; send first byte
	
	movf	temp_reg_1, 0, 0	
	call	SPI_MasterTransmit2	; send ADDRESL data to DAC

	bcf	TRISE, 2
	bsf	PORTE, 2		; set CS high
	
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop

	
	
	
	bcf	TRISE, 3
	bcf	PORTE, 3		; set LDAC low
;	movlw	.4
;	call	LCD_delay_x4us
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop
;	nop

	
	bcf	TRISE, 3
	bsf	PORTE, 3		; pulse LDAC back to high
	
	return
    
    
    
    

    
    
    
    
    
    
    
    end



