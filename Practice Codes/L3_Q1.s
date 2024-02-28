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

	LDR R0, =NUM1
	LDR R1, =NUM2
	LDR R2,[R0]
	LDR R3,[R1]
	MOV R4,#0
LOOP
	ADD R4,R2
	SUBS R3,#1
	BNE LOOP
	


STOP
	B STOP
NUM1 DCD 0x5
NUM2 DCD 0x2
	END