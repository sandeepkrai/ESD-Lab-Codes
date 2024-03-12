	AREA    RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors 
	DCD  0x100000FF     ; stack pointer value when stack is empty
    DCD  Reset_Handler  ; reset vector
  
    ALIGN

	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R0, =SRC
	LDR R2, [R0]
	MOV R1, #0
	MOV R4, #8
	MOV R5, #0
LOOP 
	MOV R3, R2
	MOV R6, #0
	CMP R3, #0X0A
	BLO NEXT
DIVIDE
	ADD R6, #1
	SUBS R3, #10
	BCS DIVIDE
NEXT
	ORR R5, R3
	LSL R5, #4
	MOV R2, R6
	SUBS R4, #1
	BNE LOOP


STOP
	B STOP
SRC DCD 0X1A2B3C 
	AREA mydata, DATA, READWRITE
DST DCD 0
	END