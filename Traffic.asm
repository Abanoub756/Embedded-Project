
_automatic:

L_automatic0:
	BTFSS      PORTA+0, 1
	GOTO       L_automatic1
	MOVLW      15
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_automatic2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__automatic36
	MOVF       _counter+0, 0
	SUBLW      0
L__automatic36:
	BTFSC      STATUS+0, 0
	GOTO       L_automatic3
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__automatic+0
	MOVF       R0+1, 0
	MOVWF      FLOC__automatic+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      4
	MOVWF      R3+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R3+0, 0
L__automatic37:
	BTFSC      STATUS+0, 2
	GOTO       L__automatic38
	RLF        R2+0, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__automatic37
L__automatic38:
	MOVF       R2+0, 0
	ADDWF      FLOC__automatic+0, 0
	MOVWF      PORTB+0
	MOVLW      255
	MOVWF      PORTC+0
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__automatic39
	MOVF       _counter+0, 0
	SUBLW      3
L__automatic39:
	BTFSC      STATUS+0, 0
	GOTO       L_automatic5
	BSF        PORTD+0, 0
	BSF        PORTD+0, 3
	BCF        PORTD+0, 1
	BCF        PORTD+0, 2
	BCF        PORTD+0, 4
	BCF        PORTD+0, 5
	GOTO       L_automatic6
L_automatic5:
	BSF        PORTD+0, 4
	BSF        PORTD+0, 0
	BCF        PORTD+0, 1
	BCF        PORTD+0, 2
	BCF        PORTD+0, 5
	BCF        PORTD+0, 3
L_automatic6:
	BTFSC      PORTA+0, 1
	GOTO       L_automatic7
	CLRF       PORTB+0
	GOTO       L_automatic3
L_automatic7:
	MOVLW      8
	MOVWF      R11+0
	MOVLW      27
	MOVWF      R12+0
	MOVLW      39
	MOVWF      R13+0
L_automatic8:
	DECFSZ     R13+0, 1
	GOTO       L_automatic8
	DECFSZ     R12+0, 1
	GOTO       L_automatic8
	DECFSZ     R11+0, 1
	GOTO       L_automatic8
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
	GOTO       L_automatic2
L_automatic3:
	MOVLW      23
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_automatic9:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__automatic40
	MOVF       _counter+0, 0
	SUBLW      0
L__automatic40:
	BTFSC      STATUS+0, 0
	GOTO       L_automatic10
	BTFSC      PORTA+0, 1
	GOTO       L_automatic12
	CLRF       PORTB+0
	GOTO       L_automatic10
L_automatic12:
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__automatic+0
	MOVF       R0+1, 0
	MOVWF      FLOC__automatic+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      4
	MOVWF      R3+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R3+0, 0
L__automatic41:
	BTFSC      STATUS+0, 2
	GOTO       L__automatic42
	RLF        R2+0, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__automatic41
L__automatic42:
	MOVF       R2+0, 0
	ADDWF      FLOC__automatic+0, 0
	MOVWF      PORTB+0
	MOVLW      255
	MOVWF      PORTC+0
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__automatic43
	MOVF       _counter+0, 0
	SUBLW      3
L__automatic43:
	BTFSC      STATUS+0, 0
	GOTO       L_automatic13
	BSF        PORTD+0, 2
	BSF        PORTD+0, 5
	BCF        PORTD+0, 0
	BCF        PORTD+0, 1
	BCF        PORTD+0, 4
	BCF        PORTD+0, 3
	GOTO       L_automatic14
L_automatic13:
	BSF        PORTD+0, 1
	BSF        PORTD+0, 5
	BCF        PORTD+0, 0
	BCF        PORTD+0, 2
	BCF        PORTD+0, 4
	BCF        PORTD+0, 3
L_automatic14:
	MOVLW      8
	MOVWF      R11+0
	MOVLW      27
	MOVWF      R12+0
	MOVLW      39
	MOVWF      R13+0
L_automatic15:
	DECFSZ     R13+0, 1
	GOTO       L_automatic15
	DECFSZ     R12+0, 1
	GOTO       L_automatic15
	DECFSZ     R11+0, 1
	GOTO       L_automatic15
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
	GOTO       L_automatic9
L_automatic10:
	GOTO       L_automatic0
L_automatic1:
L_end_automatic:
	RETURN
; end of _automatic

_manual:

	BTFSC      PORTA+0, 1
	GOTO       L_manual18
	BTFSC      PORTA+0, 2
	GOTO       L_manual18
L__manual34:
	BTFSC      PORTD+0, 2
	GOTO       L__manual33
	BTFSC      PORTD+0, 1
	GOTO       L__manual33
	GOTO       L_manual21
L__manual33:
	BSF        PORTD+0, 1
	BSF        PORTD+0, 5
	BCF        PORTD+0, 2
	BCF        PORTD+0, 0
	BCF        PORTD+0, 3
	BCF        PORTD+0, 4
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_manual22:
	DECFSZ     R13+0, 1
	GOTO       L_manual22
	DECFSZ     R12+0, 1
	GOTO       L_manual22
	DECFSZ     R11+0, 1
	GOTO       L_manual22
	NOP
	BSF        PORTD+0, 0
	BSF        PORTD+0, 3
	BCF        PORTD+0, 2
	BCF        PORTD+0, 1
	BCF        PORTD+0, 5
	BCF        PORTD+0, 4
	GOTO       L_manual23
L_manual21:
	BTFSC      PORTD+0, 3
	GOTO       L__manual32
	BTFSC      PORTD+0, 4
	GOTO       L__manual32
	GOTO       L_manual26
L__manual32:
	BSF        PORTD+0, 4
	BSF        PORTD+0, 0
	BCF        PORTD+0, 2
	BCF        PORTD+0, 1
	BCF        PORTD+0, 3
	BCF        PORTD+0, 5
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_manual27:
	DECFSZ     R13+0, 1
	GOTO       L_manual27
	DECFSZ     R12+0, 1
	GOTO       L_manual27
	DECFSZ     R11+0, 1
	GOTO       L_manual27
	NOP
	BSF        PORTD+0, 5
	BSF        PORTD+0, 2
	BCF        PORTD+0, 0
	BCF        PORTD+0, 1
	BCF        PORTD+0, 3
	BCF        PORTD+0, 4
L_manual26:
L_manual23:
L_manual18:
L_end_manual:
	RETURN
; end of _manual

_main:

	MOVLW      7
	MOVWF      ADCON1+0
	MOVLW      63
	MOVWF      TRISA+0
	CLRF       TRISB+0
	CLRF       TRISC+0
	CLRF       TRISD+0
	MOVLW      63
	MOVWF      PORTA+0
	CLRF       PORTB+0
	MOVLW      255
	MOVWF      PORTC+0
	CLRF       PORTD+0
L_main28:
	BTFSS      PORTA+0, 0
	GOTO       L_main29
	GOTO       L_main28
L_main29:
L_main30:
	CALL       _automatic+0
	CALL       _manual+0
	GOTO       L_main30
L_end_main:
	GOTO       $+0
; end of _main
