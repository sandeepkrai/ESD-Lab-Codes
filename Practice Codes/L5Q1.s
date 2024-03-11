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
	LDR R0, =codememory_data
	LDR R1, =datamemory_data
	MOV R2, #8
	
LOOP1
	LDR R3, [R0], #4
	STR R3, [R1], #4
	SUBS R2, #1
	BNE LOOP1

	LDR R0, =datamemory_data
	LDR R1, =datamemory_data
	
	
	MOV R8, #8

OUTER
	MOV R0, R1
	MOV R7, R1
	MOV R4, R8
	LDR R2, [R1]
LOOP
	LDR R3, [R0], #4
	CMP R2, R3
	BCC NEXT
	MOV R2, R3
	SUB R0, #4
	MOV R7, R0
	ADD R0, #4
NEXT
	SUBS R4, #1
	BNE LOOP
	
	
	LDR R6, [R1]
	
	CMP R6, R2
	BEQ OUTER1
	
	STR R2, [R1]
	STR R6, [R7]
OUTER1	
	ADD R1, #4
	SUBS R8, #1
	BNE OUTER
	
stop B stop
codememory_data DCD 0X11111111, 0X22222222, 0X33333333, 0X88888888, 0X44444444, 0X55555555, 0X66666666, 0X77777777
	AREA datamemory, DATA, READWRITE
datamemory_data DCD 0
	end