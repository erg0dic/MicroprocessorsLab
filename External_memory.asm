#include p18f87k22.inc

    global  ADC_Setup, ADC_Read
    extern  LCD_delay_ms

memory_interface    code
    
init_chip_s
	movlw	b'11111101'		    ; set RE1 tris to low so its the only output
	movwf	TRISE
	movlw	b'00000010'		    ; set RE1 to high and call a delay
	movwf	PORTE
	movlw	.10
	call	LCD_delay_ms	
	movlw   0x00	    ; set RE1 to low
	movwf	TRISE
	return
	
write_sequence_init
	movlw	b'11011111'		    ; set RC4 tris to low so its the only output
	movwf	TRISE	
	movlw	b'00000110'		; Set write enable latch opcode to initialize writing into the external memory	
	
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    end
