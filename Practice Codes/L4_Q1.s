	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R1, =DST
	MOV R6, #N
	MOV R2, #2
	MOV R3, #0
	MLA R5, R6, R6, R6
LOOP
	SUB R5, R2
	ADD R3, #1
	CMP R5, R2
	BCS LOOP
	STR R3, [R1]
STOP
	B STOP
N EQU 100
	AREA DATASEG, DATA, READWRITE
DST DCD 0X10000000
	END