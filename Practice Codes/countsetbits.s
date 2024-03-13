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
	MOV R1, #0X1
	MOV R2, #0
	MOV R5, #32
LOOP
	LDR R3, [R0]
	AND R4, R3, R1
	CMP R4, #0X0
	BEQ NEXT
	ADD R2, #1
NEXT
	LSL R1, #1
	SUBS R5, #1
	BNE LOOP
	
STOP
	B STOP
SRC DCD 0X11111111
	AREA mydata, DATA, READWRITE
DST DCD 0
	END