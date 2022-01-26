GENERATERANDOMNUMBER:
MOV AH, 00h        
INT 1AH          

mov  ax, dx
xor  dx, dx
mov  cx, 10    
div  cx         
lea di,deger
mov al,dl
stosb    
 
     

AGAIN:    
MOV DX, OFFSET screen_message
CALL WRITESTRING 
CALL READKEY       
SUB	AL,30h		
MOV BH,AL   
CALL CHECHIFNOTNUMBER        



COMPARE:      
lea si,guess
lodsb
inc al 
lea di,guess 
stosb

lea si,deger
lodsb    
CMP BH,AL	
JNE TahminSayisiniArttir

lea si,win
lodsb
inc al 
lea di,win 
stosb
    

TahminSayisiniArttir: 
CALL WRITETOLCD
mov dx,205Dh  
MOV AL,guess[0] 
out DX,AL   

ForSevenSegmentDisplay:  

MOV DX, 2037H 
lea si,deger
lodsb 
MOV AH,0H
MOV SI,AX 
MOV AL,NUMBERS[SI]
OUT DX,AL

MOV DX, 2032H
MOV BL,BH
MOV BH,0H
MOV SI,BX
MOV AL,NUMBERS[SI]
OUT DX,AL       

MOV DX, 2030h 
MOV AL, 00111110b
OUT DX, AL   
   
MOV DX, 2031h 
MOV AL, 01000000b
OUT DX, AL 

MOV DX, 2035h 
MOV AL, 000111001b
OUT DX, AL 

MOV DX, 2036h 
MOV AL, 01000000b
OUT DX, AL      
     
JMP GENERATERANDOMNUMBER

         

EXIT:
MOV AH,4CH 
INT 21H     


ret    

screen_message db 13,10,'Enter a number between 0-9: $'  
deger db 1 dub(0)    
NUMBERS	DB 00111111b, 00000110b, 01011011b, 01001111b, 01100110b, 01101101b, 01111101b, 00000111b, 01111111b, 01101111b
YOUWIN DB "YOU WIN : "
TOTALGUESS DB "TOTAL GUESS : "
win db "0" 
guess db "0"




WRITESTRING PROC 
MOV AH,09H
INT 21H			
RET    
WRITESTRING ENDP


READKEY PROC
MOV AH,01h			
INT 21h
RET    
READKEY ENDP  

CHECHIFNOTNUMBER PROC    
MOV CX,10    
MOV AH,0
LOOP1:  
CMP AH,BH  
JE COMPARE
 
ADD AH,1
LOOP LOOP1
JMP AGAIN      

CHECHIFNOTNUMBER ENDP  


WRITETOLCD PROC 
   
mov dx,2049h  
MOV AL,win[0] 
out DX,AL    
    
mov dx,2040h     
mov si,0
mov cx,9

NEXT:
    MOV AL,YOUWIN[SI]
	out DX,AL
	INC SI
	INC DX

	LOOP NEXT    
	
mov dx,2050h     
mov si,0
mov cx,13

NEXT2:
    MOV AL,TOTALGUESS[SI]
	out DX,AL
	INC SI
	INC DX

	LOOP NEXT2 	
		
RET	   
    
WRITETOLCD ENDP 

