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
    ; Load the first BCD number into R1
    LDR R0, =BCD_NUM1
    LDR R1, [R0]

    ; Load the second BCD number into R2
    LDR R0, =BCD_NUM2
    LDR R2, [R0]

    ; Clear R3 to store the result
    MOV R3, #0

    ; Clear carry flag
    MOV R4, #0

BCD_MUL_LOOP
    ; Multiply the least significant digit of R1 and R2
    AND R5, R1, #0xF   ; Mask out the least significant digit of R1
    AND R6, R2, #0xF   ; Mask out the least significant digit of R2
    MUL R7, R5, R6     ; Multiply the digits
    ADDS R8, R7, R4    ; Add previous carry
    ADC R4, R4, #0     ; Update carry flag

    ; Add the result to R3 with appropriate shift
    LSL R9, R8, #4     ; Shift the result to the left by 4 bits
    ADD R3, R3, R9     ; Add the shifted result to R3

    ; Shift R1 and R2 right by 4 bits
    LSR R1, R1, #4     ; Shift R1 right by 4 bits
    LSR R2, R2, #4     ; Shift R2 right by 4 bits

    ; Check if both numbers are zero
    ORR R10, R1, R2
    CMP R10, #0
    BNE BCD_MUL_LOOP   ; Repeat the process if either number is not zero

    ; Store the result
    LDR R0, =BCD_RESULT
    STR R3, [R0]

STOP
    B STOP

BCD_NUM1 DCD 0X1234   ; Example BCD number 1
BCD_NUM2 DCD 0X5678   ; Example BCD number 2

    AREA mydata, DATA, READWRITE
BCD_RESULT DCD 0        ; Result of BCD multiplication
    END
