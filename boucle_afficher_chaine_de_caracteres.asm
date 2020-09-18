    

    code segment use16
    
    assume cs:code, ds:data, ss:pile
    
    
    debut:
    
    mov ax, data ;chargger ds avec l'adresse du segment data      
    mov ds, ax
                
    mov cx, 12
    
    boucle:
    
    call ecrit_message  ;appel de procedure
    loop boucle  ;decrementer CX  et sauter a "boucle" si CX <>0
    
    mov ah, 4ch   ;4C = numeroo de fonction de l'int. 21h qui sert a quitter
    int 21h
    
    ret
    
    ecrit_message proc near:
    
    mov ah, 09h
    mov dx, offset message
    int 21h
              
    ret
         
    ecrit_message endp
    
    
    
    code ends

    data segment use16
        
    message db "Sa kap fet ? ",10,13,'$'
        
    data ends 
    
    pile segment stack
        
    remplissage bd 256 DUP(?)
    pile ends
    
    
    end debut
    