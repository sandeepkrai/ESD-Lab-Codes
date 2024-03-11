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
	MOV R0,#0xAA,#2
STOP
	B STOP
N1 DCD 0X79
	AREA mydata, DATA, READWRITE
RES DCD 0
	END
	