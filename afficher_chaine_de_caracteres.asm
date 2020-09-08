;EXERCICE 23
;----------------------------------------
;Program  : Afficher une chaine de caracteres 
;FileName : afficher_chaine_de_caracteres.asm
;I/P 	  : Bonjour
;O/P 	  : Bonjour 
;By       : Kevin DUBUCHE 
;---------------------------------------- 

;Ecrire un programme assembleur en 8086 pour afficher
;une haine de caracteres donnee.          

;__________________________________________________________

.MODEL SMALL
 .STACK 100H

 .DATA
    STRING_1  DB  'Bonjour$'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, STRING_1             ; load & display the STRING_1  
     MOV AH, 9            
     INT 21H


     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN