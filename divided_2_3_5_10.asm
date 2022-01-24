org 100h     

divided2:
MOV AL, K              
MOV BL ,2
DIV BL
CMP AH,0   
JNE divided3 
lea si,MESSAGE1
call print


 
divided3:
mov ah,0
MOV AL, K      
MOV BL ,3
DIV BL
CMP AH,0  
JNE divided5      
lea si,MESSAGE2
call print    
 

 
divided5:
mov ah,0
MOV AL, K
MOV BL ,5
DIV BL
CMP AH,0  
JNE divided10    
lea si,MESSAGE3
call print   

    
 
divided10: 
mov ah,0
MOV AL, K
MOV BL ,10
DIV BL
CMP AH,0  
JNE exit  
lea si,MESSAGE4
call print     
jmp exit


print PROC    
mov cx,32 
mov ah, 0Eh
display: 
lodsb        
int 10h                       
loop display    
ret         
print endp  
                 
         
exit:      
mov ah,4ch
INT 21h


ret        

K db 15     
MESSAGE1 DB 'The number can be divided by 2',13,10 
MESSAGE2 DB 'The number can be divided by 3',13,10
MESSAGE3 DB 'The number can be divided by 5',13,10 
MESSAGE4 DB 'The number can be divided by 10',13,10 