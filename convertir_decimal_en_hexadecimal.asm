.model small
.stack 100h
.data
;;;;;;;;;;;; on stock la valeur a convertir dans d1
d1 dw 2
.code

main proc far
	;;;;;;chargement du segment de code 
	mov ax, @data
	mov ds, ax
	;;;;;; fin chargement du segment de code 

	;;;;;;chargement de la valeur en decimal a convertir
	mov ax, d1
	;;;;;;appel de la procedure qui fait la converion
	call print
	;;;;;;;;;;;;;fin du programme
	mov ah, 4ch
	int 21h

main endp

;;;;;;;;definition de ma procedure
print proc
	;;;;;;;;;CX taille de la pile qui va recevoir les nombres
	mov cx, 0
	;;;;;;;;dx recoit le reste le la division
	mov dx, 0

	;;;;;;;;on compare AX a 0
	label1:
		cmp ax, 0
		je print1
	
	mov bx, 16
	;;;;;;;;;;;on divise par 16 pour la conversion en hexadecimal
	;;;;;;;;;;;AX est divise par BX, le quotient est dans ax (plus precisement AL) et le reste dans dx
	div bx
	push dx
	;;;;;;;;on incremente cx car pour chaque division on push le quotient dans la pile
	inc cx
	;;;;;;;;;;on met dx, qui recoit le reste de la division a 0 (xor est plus efficace que mov dx,0)
	xor dx, dx
	jmp label1

	print1:
		;;;;;;;;verifier si CX est > 0 por savoir s'il reste un element a convertir (en lettre) dans la pile 
		cmp cx,0
		je exit

	pop dx
	;;;;;;;comparer avec 9 pour mettre des lettres
	cmp dx, 9
	jle continue
	;;;;;;; si DX > 9 on ajoute 7 pour avoir le code ascii de la lettre correspondante
	add dx, 7

	continue:
		;;;;;;;;;;;normalement on ajoute 48 pour avoir la representation ascii des digit
		add dx, 48

	;;;;;;;;afficher la valeur popee
	mov ah, 02h
	int 21h

	dec cx
	jmp print1

	exit:
		ret

print endp
end main
