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
	LDR R1, [R0]
	MOV R4, #8
	MOV R5, #0
	MOV R3, #10

LOOP
	UDIV R6, R1, R3 ; R6 = R1 / R2
	MLS R7, R6, R3, R1 ; R7 = R1 - R6 * R3
	ADD R5, R7
	ROR R5, #4
	MOV R1, R6
	SUBS R4, #1
	BNE LOOP
	
	LDR R1, =DST
	STR R5, [R1]

STOP
	B STOP
SRC DCD 0X1A2B3C 
	AREA mydata, DATA, READWRITE
DST DCD 0
	END