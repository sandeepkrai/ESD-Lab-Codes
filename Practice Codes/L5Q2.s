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
	LDR R4, =datamemory_data
	MOV R1, #1
	LDR R2, [R0]
LOOP
	MUL R1, R2
	SUBS R2, #1
	BNE LOOP
	
	STR R1, [R4]
	
stop B stop
codememory_data DCD 0X5
	AREA datamemory, DATA, READWRITE
datamemory_data DCD 0
	end