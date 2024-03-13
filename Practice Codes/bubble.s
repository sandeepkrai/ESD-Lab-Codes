	AREA reset,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R0, =SRC
	MOV R2, #4
	LDR R3, =DST
LOOP
	LDR R1, [R0], #4
	STR R1, [R3], #4
	SUBS R2, #1
	BNE LOOP
	
	MOV R2, #3
	
OUTER
	LDR R0, =DST
	LDR R1, =DST
	ADD R1, #4
	MOV R3, #3
	
INNER
	LDR R4, [R0], #4
	LDR R5, [R1], #4
	CMP R4, R5
	BHI SWAP
	SUBS R3, #1
	BNE INNER
	SUBS R2, #1
	BNE OUTER
	BEQ stop

SWAP 
	SUB R0, #4
	STR R5, [R0], #4
	SUB R1, #4
	STR R4, [R1], #4
	SUBS R3, #1
	BNE INNER
	SUBS R2, #1
	BNE OUTER
	
	
stop B stop
SRC DCD 0X1, 0X5, 0X2, 0X0
	AREA datamemory, DATA, READWRITE
DST DCD 0
	END