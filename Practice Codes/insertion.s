	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x100000FF
	DCD Reset_Handler
	
	ALIGN
	
	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R0, =NUM
	LDR R1, =DST
	MOV R2, #4
	
LOOP1
	LDR R3,[R0],#04
	STR R3,[R1],#04
	SUBS R2,#1
	BNE LOOP1

	LDR R0, =DST
	LDR R1, =DST
	MOV R3, #3
	MOV R5, #1
	
OUTER
	MOV R1, R0
	MOV R2, R0
	ADD R1, #4
	MOV R6, R5
	
LOOP
	LDR R7, [R1], #-4
	LDR R4, [R2], #-4
	CMP R4, R7
	BHI SWAP
	SUBS R6, #1
	BNE LOOP
	BEQ NEXT
	
SWAP
	MOV R8, R7
	MOV R7, R4
	MOV R4, R8
	ADD R1, #4
	ADD R2, #4
	STR R7, [R1]
	STR R4, [R2]
	SUB R1, #4
	SUB R2, #4
	SUBS R6, #1
	BNE LOOP
	
	
NEXT
	ADD R5, #1
	ADD R0, #4
	SUBS R3, #1
	BNE OUTER
	

stop B stop
NUM DCD 0x55555555, 0x22222222, 0x66666666, 0x11111111
	AREA datamemory, DATA, READWRITE
DST DCD 0
	END