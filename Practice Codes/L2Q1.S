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
	MOV R3, #0
	MOV R5, #0
	
LOOP
	LDR R4, [R0]
	ADDS R3, R4
	ADC R5, #0
	ADD R0, #4
	SUBS R2, #1
	BNE LOOP
	
	STR R5, [R1]
	ADD R1, #4
	STR R3, [R1]

stop B stop
codememory_data DCD 0X11111111, 0X22222222, 0X33333333, 0X44444444, 0X55555555, 0X66666666, 0X77777777, 0X88888888, 0X99999999, 0XAAAAAAAA
	AREA datamemory, DATA, READWRITE
datamemory_data DCD 0
	end