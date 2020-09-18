;8086 program to convert a 16 bit decimal number to binary 
.MODEL SMALL 
.STACK 100H 
.DATA 
d1 dw 65535
.CODE 
MAIN PROC FAR 
	MOV AX, @DATA 
	MOV DS, AX 
	mov ax, d1 ;load the value stored in variable d1 
	CALL PRINT ;convert the value to binary print the value 
	MOV AH, 4CH ;interrupt to exit
	INT 21H 
MAIN ENDP


PRINT PROC  
  mov cx, 0 ;initilize count
  mov dx, 0 
  
  label1:  ; if ax is zero 
	cmp ax, 0 
	je print1 

  mov bx, 2 ;initilize bx to 2 
  div bx ;devide it by 2 to convert it to binary 
  push dx ;push it in the stack 
  inc cx ;increment the count 
  xor dx,dx ;set dx to 0 
  jmp label1 
			
  print1: 
  	cmp cx, 0 ;check if count is greater than zero 
	je exit
 
	pop dx ;pop the top of stack
	add dx, 48 ;add 48 so that it represents the ASCII value of digits 

	mov ah, 02h ;interrupt to print a character 
	int 21h 

	dec cx ;decrease the count  
	jmp print1 

  exit: ret 

PRINT ENDP 
END MAIN 
