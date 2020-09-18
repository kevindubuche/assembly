;EXERCICE 3
;----------------------------------------
;Program  : Decimal -> binaire
;FileName : convertir_decimal_en_binaire.asm
;I/P 	  : 8
;O/P 	  : 1000 
;By       : Kevin DUBUCHE 
;---------------------------------------- 

;Ecrire un programme assembleur en 8086 qui convertit
;un nombre decimal de 16 bit en nombre binaire        

;__________________________________________________________

;;;;;;8086 programme pour convertir un decimal de 16 bit en binaire
.MODEL SMALL 
.STACK 100H 
.DATA 
;;;;;;;;;;;; on stock la valeur a convertir dans d1
d1 dw 8
.CODE 

MAIN PROC FAR 
    ;;;;;;chargement du segment de code
	MOV AX, @DATA 
	MOV DS, AX 
	;;;;;; fin chargement du segment de code 

	;;;;;;chargement de la valeur en decimal a convertir
	mov ax, d1 
	;;;;;;appel de la procedure qui fait la converion
	CALL PRINT 
	;;;;;;;;;;;;;fin du programme
	MOV AH, 4CH 
	INT 21H 
MAIN ENDP


;;;;;;;;definition de ma procedure
PRINT PROC  
  ;;;;;;;;;CX taille de la pile qui va recevoir les nombres
  mov cx, 0 
  ;;;;;;;;dx recoit le reste le la division
  mov dx, 0 
  
  ;;;;;;;;on compare AX a 0
  label1:  
	cmp ax, 0 
	je print1 

  ;;;;;on met 2  dans bs, car on fera des divisions successives par 2
  mov bx, 2 
  ;;;;;;;;;;;on divise par 16 pour la conversion en hexadecimal
  ;;;;;;;;;;;AX est divise par BX, le quotient est dans ax (plus precisement AL) et le reste dans dx
	
  div bx 
  push dx 
  ;;;;;;;;on incremente cx car pour chaque division on push le quotient dans la pile
  inc cx 
  ;;;;;;;;;;on met dx, qui recoit le reste de la division a 0 (xor est plus efficace que mov dx,0)
  xor dx,dx 
  jmp label1 
			
  print1: 
    ;;;;;;;;verifier si CX est > 0 por savoir s'il reste un element a convertir (en lettre) dans la pile
  	cmp cx, 0 
	je exit
 
	pop dx 
	;;;;;;;on ajoute 48 pour avooir l'equivalent des digit en  ASCII
	add dx, 48 
	;;;;;on affiche le caractere grace a l'interruption suivante
	mov ah, 02h 
	int 21h 

	;;;;on decremente le compteur
	dec cx 
	jmp print1 

  exit: ret 

PRINT ENDP 
END MAIN 
