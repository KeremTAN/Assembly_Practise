ORG 100h    

LEA SI, A  
LEA DI, B 
MOV CX, 4 
MOV AH, 0Eh  

m: 
LODSB    
push ax
INT 10h 
LOOP m   
      
MOV CX, 4   

n: 
pop ax 
STOSB
INT 10h
LOOP n

RET        
                            
A DB 'c', 'e', 'n', 'g'  
B DB 4 dup('0')