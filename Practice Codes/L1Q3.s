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
	MOV R2, #10
	
LOOP
	LDR R3, [R0], #4
	STR R3, [R1], #4
	SUBS R2, #1
	BNE LOOP
	
	LDR R0, =datamemory_data
	
	SUB R1, #4
	MOV R2, #5
	
LOOP1
	LDR R3, [R0]
	LDR R5, [R1]
	STR R5, [R0], #4
	STR R3, [R1], #-4
	SUBS R2, #1
	BNE LOOP1
	
stop B stop
codememory_data DCD 0X11111111, 0X22222222, 0X33333333, 0X44444444, 0X55555555, 0X66666666, 0X77777777, 0X88888888, 0X99999999, 0XAAAAAAAA
	AREA mydata, DATA, READWRITE
datamemory_data DCD 0
	end