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

    

    code segment use16
    
    assume cs:code, ds:data, ss:pile
    
    
    debut:
    
    mov ax, data ;chargger ds avec l'adresse du segment data      
    mov ds, ax
    
    mov ah, 09h
    mov dx, offset message
    int 21h
    
    mov ah, 4ch   ;4C = numeroo de fonction de l'int. 21h qui sert a quitter
    int 21h
    
    code ends

    data segment use16
        
    message db "Sa kap fet ? ",'$'
        
    data ends 
    
    pile segment stack
        
    remplissage bd 256 DUP(?)
    pile ends
    
    
    end debut
    