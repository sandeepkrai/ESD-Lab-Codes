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
	
	ADD R0, #12
	MOV R2, R0
	ADD R0, #16
	
	ADD R1, #16
	
	MOV R3, #0
	MOV R6, #4
	
LOOP
	LDR R4, [R0], #-4
	LDR R5, [R2], #-4
	ADDS R3, R4
	ADDS R3, R5
	STR R3, [R1], #-4
	MOV R3, #0
	ADCS R3, #0
	SUBS R6, #1
	BNE LOOP

	STR R3, [R1]

stop B stop
codememory_data DCD 0XA1111111, 0X22222222, 0X33333333, 0X44444444, 0X55555555, 0X66666666, 0X77777777, 0XA8888888
	AREA datamemory, DATA, READWRITE
datamemory_data DCD 0
	end