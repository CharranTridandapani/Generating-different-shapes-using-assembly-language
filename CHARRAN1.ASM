.model small
.stack 100h
.data
tem_data DB  13,10,'$'
                        mess1 DB  09, 'PATTERN MANAGEMNT SYSTEM$'
                        mess2 DB  09,  ' __ _ _  __       __   _ _ _ _ _ _   $'
                        mess3 DB  09,  '|  __  | | \    / ||  | _ _ _ _ _ _|  $'
                        mess4 DB  09,  '| |__| | ||\\  // ||  || __ __ ___    $'
                        mess5 DB  09,  '| __ _ | || \\//  ||  |_ __ __ _  |   $'
                        mess6 DB  09,  '| |      ||       ||    __ __ __| |   $'
                        mess7 DB  09,  '|_|      ||       ||   |__ __ __ _|   $'

                        Option db 09,'Please choose among the following:$'
                        Option1 db 10,9, "1. pyramid Numbered pattern. $"
                        Option2 db 10,9, "2. rectangle Designed pattern. $"
                        Option3 db 10,9, "3. square box  pattern.$"
                        Option4 db 10,9, "4. nested  right angled triangle pattern. $"
                        Option5 db 10,9, "5. triangle pattern .$"
                        Option6 db 10,9, "6. Exit. $"
                        choice db 13,10, "Enter choice:$",13,10

star db ?
blank db ?

      
.CODE
;macro
showmessage Macro Mess
lea dx,Mess
mov ah,9h
int 21h
EndM
Main Proc
         mov ah,6 ;clear the screen
         mov al,0 ;fullup the screen
         int 10h
         mov ax,@data ; get  data segment
         mov ds,ax ; point DS to  the data segment
         mov ah,13h ; assign cursor to start somewhere
         mov al,0 ; check accumulator register at  level 0
         mov bh,0 ; check  base register at level 0
         mov cx,6 ; number of character displayed from the msg
         mov dh,3 ; number of vertical line beginning of the cursor
         mov dl,36 ; number of horizontal lines
         mov bp, offset mess1 ;display  the message
         int 10h
         mov ah,13h
         mov al,0
         mov bh,0
         mov bl,14
         mov cx,8
         mov dh,4
         mov dl,35
         mov bp, offset mess1
         int 10h
         mov ah,13h
         mov al,0
         mov bh,0
         mov bl,14
         mov cx,2
         mov dh,5
         mov dl,35
         mov bp, offset mess1
         int 10h
         mov ah,13h
         mov al,0
         mov bh,0
         mov bl,14
         mov cx,2
         mov dh,5
         mov dl,41
         mov bp, offset mess1
         int 10h
         mov ah,13h
         mov al,0
         mov bh,0
         mov bl,14
         mov cx,2
         mov dh,6
         mov dl,35
         mov bp, offset mess1
         int 10h
         mov ah,13h
         mov al,0
         mov bh,0
         mov bl,14
         mov cx,2
         mov dh,6
         mov dl,41
         mov bp, offset mess1
         int 10h
         mov ah,13h
         mov al,0
         mov bh,0
         mov bl,14
         mov cx,2
         mov dh,7
         mov dl,35
         mov bp, offset mess1
         int 10h
         mov ah,13h
         mov al,0
         mov bh,0
         mov bl,14
         mov cx,2
         mov dh,7
         mov dl,41
         mov bp, offset mess1
         int 10h
         mov ah,13h
         mov al,0
         mov bh,0
         mov bl,14
         mov cx,2
         mov dh,8
         mov dl,35
         mov bp, offset mess1
         int 10h
         mov ah,13h
         mov al,0
         mov bh,0
         mov bl,14
         mov cx,2
         mov dh,8
         mov dl,41
         mov bp, offset mess1
         int 10h
         mov ah,13h
         mov al,0
         mov bh,0
         mov bl,14
         mov cx,8
         mov dh,9
         mov dl,35
         mov bp, offset mess1
         int 10h
         mov ah,13h
         mov al,0
         mov bh,0
         mov bl,14
         mov cx,6
         mov dh,10
         mov dl,36
         mov bp, offset mess1
         int 10h
showmessage mess1
showmessage tem_data
showmessage mess2
showmessage tem_data
showmessage mess3
showmessage tem_data
showmessage mess4
showmessage tem_data
showmessage mess5
showmessage tem_data
showmessage mess6
showmessage tem_data
showmessage mess7
showmessage tem_data
showmessage tem_data
showmessage tem_data
showmessage Option
showmessage Option1
showmessage Option2
showmessage Option3
showmessage Option4
showmessage Option5
showmessage Option6

OptionList:
            mov ah,9
            showmessage choice
            mov ah,1
            int 21h
            cmp al,49
            jne pyramido
            call number ; call the number procedure
            jmp begin

pyramido:
            cmp al,50
            jne square_box
            call recto1 ; call the design procedure
            jmp begin

square_box:
            cmp al,51
            jne nested_triangles
            call square_box1 ; call the square_box procedure
            jmp begin

nested_triangles:
                  cmp al,52
                  jne tri
                  call nest  ; call the nested_triangles procedure
                  jmp begin

tri:
      cmp al,53
      jne end_program 
      call tri1
      jmp begin



end_program :  ;to end the program
            cmp al,54
            jne error_msg 
            jmp ending
error_msg: ; display error message in case of wrong input
         mov al,9
         int 21h

begin:;to loop the Option
      loop OptionList

ending:
       mov cx,5
top:
      mov dl,10
      mov ah,2
      int 21h
      loop top
      mov ah,4ch
      int 21h
main endp

;diomond number pattern procedure
number proc
            mov bl,09
            int 21h
            mov cx,5 ; set counter to 5
            mov bx,1  ; base value set to 1
dio1:
   push cx
dio2:
      mov ah,2 ;display character service
      mov dl,32 ;display space
      int 21h ;call DOS
      loop dio2
      mov cx, bx ;compare cx with bx
dio3:
      mov ah,2
      mov dl,'3' ;display number 9
      int 21h
      loop dio3
      mov ah,2
      mov dl,10 ;line feed
      int 21h
      mov dl,13 ;carriage return
      int 21h
      inc bx ;increment bx
      inc bx
      pop cx
      loop dio1
      mov cx,4
      mov bh,7 ;base reg value is 7
      mov bl,2 ;base value set to 2
      mov star, bh
      mov blank, bl
dio4:
      cmp blank, 0 ;compare blank with 0
      JE dio5 ;jump to dio5 if equal
      mov ah,2
      mov dl,32
      int 21h
      dec blank ;decrement blank by 1
      JMP dio4
dio5:
      mov ah,2
      mov dl,'5'
      int 21h
      dec star
      cmp star,0
      jne dio5
dio6:
      mov ah,2
      mov dl,10
      int 21h
      mov dl,13
      int 21h
      dec bh
      dec bh
      mov star, bh
      inc bl
      mov blank,bl
      loop dio4
      ret
number endp



;RECTANGLE DESIGN PATTERN PROCEDURE 

recto1 proc
mov bl,09
int 21h
mov cx,5
mov bx,5
    
    p1:
            push cx
            mov cx,5
       
    p2:
            mov ah,2
            mov dl,"*"
            int 21h
            loop p2
            mov ah,2
            mov dl,10
            int 21h
            mov dl, 13
            int 21h 
            pop cx
            loop p1
            ret 
recto1 endp







;square square_box pattern procedure
square_box1 proc
                  mov dl,10
                  int 21h
                  mov ah,2; display character service
                  mov bl,5; set register to 5
                  mov cl,0;cl register value set to 0
                  mov ch,8;ch register value is 8

;First line
squareline1:
            inc cl 
            mov dl, 'C' 
            int 21h 
            mov dl, " " 
            int 21h
            cmp cl, ch 
            jne squareline1 
            mov ah,2
            mov dl,00h
            int 21h
            mov dl,10 
            int 21h

;Second line
mov dl,'C'
int 21h 
mov dl," "
int 21h
mov cl,0
mov ch,6
squareline2:
            inc cl 
            mov dl,'C'
            int 21h
            mov dl," "
            int 21h
            cmp cl,ch
            jne squareline2
            mov dl,'C'
            int 21h 
            mov ah,2
            mov dl,00h 
            int 21h
            mov dl,10
            int 21h

;Third line
mov dl,'C'
int 21h 
mov dl," "
int 21h
mov dl,'C'
int 21h 
mov dl," "
int 21h
mov cl,0
mov ch,4
squareline3:
            inc cl 
            mov dl,'C'
            int 21h
            mov dl," "
            int 21h
            cmp cl,ch
            jne squareline3
            mov dl,'C'
            int 21h 
            mov dl," "
            int 21h
            mov dl,'C'
            int 21h 
            mov ah,2
            mov dl,00h 
            int 21h
            mov dl,10
            int 21h

;Fourth line
mov dl,'C'
int 21h 
mov dl," "
int 21h
mov dl,'C'
int 21h 
mov dl," "
int 21h
mov dl,'C'
int 21h 
mov dl," "
int 21h
mov cl, 0
mov ch, 2
squareline4:
            inc cl 
            mov dl,'C'
            int 21h
            mov dl," "
            int 21h
            cmp cl,ch
            jne squareline4
            mov dl,'C'
            int 21h 
            mov dl," "
            int 21h
            mov dl,'C'
            int 21h 
            mov dl," "
            int 21h
            mov dl,'C'
            int 21h 
            mov ah,2
            mov dl,00h 
            int 21h
            mov dl,10
            int 21h

;Fifth line
mov dl,'C'
int 21h 
mov dl," "
int 21h
mov dl,'C'
int 21h 
mov dl," "
int 21h
mov dl,'C'
int 21h 
mov dl," "
int 21h
mov cl,0
mov ch,2
squareline5:
            inc cl 
            mov dl,'C'
            int 21h
            mov dl," "
            int 21h
            cmp cl,ch
            jne squareline5
            mov dl,'C'
            int 21h 
            mov dl," "
            int 21h
            mov dl,'C'
            int 21h 
            mov dl," "
            int 21h
            mov dl,'C'
            int 21h 
            mov ah,2
            mov dl,00h
            int 21h
            mov dl,10
            int 21h

;Sixth line
mov dl,'C'
int 21h 
mov dl," "
int 21h
mov dl,'C'
int 21h 
mov dl," "
int 21h
mov cl,0
mov ch,4
squareline6:
            inc cl 
            mov dl,'C'
            int 21h
            mov dl," "
            int 21h
            cmp cl,ch
            jne squareline6
            mov dl,'C'
            int 21h 
            mov dl," "
            int 21h
            mov dl,'C'
            int 21h 
            mov ah,2
            mov dl,00h 
            int 21h
            mov dl,10
            int 21h

;Seventh line
mov dl,'C'
int 21h 
mov dl," "
int 21h
mov cl,0
mov ch,6
squareline7:
            inc cl 
            mov dl,'C'
            int 21h
            mov dl," "
            int 21h
            cmp cl,ch
            jne squareline7
            mov dl,'C'
            int 21h 
            mov ah,2
            mov dl,00h 
            int 21h
            mov dl,10
            int 21h

;8th line
mov cl,0
mov ch,8
squareline8:
            inc cl
            mov dl,'C' 
            int 21h
            mov dl, " "
            int 21h
            cmp cl,ch
            jne squareline8
            mov ah,2
            mov dl,00h 
            int 21h
            mov dl,10
            int 21h
            ret
square_box1 endp



;nested_triangles loop pattern procedureD
nest proc
         mov dl,10
         int 21h
         mov ah,2;display character function/service
         mov bl,10;base value set to 10 ( 10 rows)
         mov cl,0;cl register value set to 0 (counter register always 0)
         mov ch,1;ch register value is 1 (counter high bit reg) cl - row, ch-column
         mov bh,1;base reg value is 1
topz:
      inc cl 
      mov dl,42 
      int 21h 
      cmp cl,ch 
      jne topz 
      mov dl,09 
      int 21h
      mov cl,0


;display the second triangle
bot:
      inc cl
      mov dl,42
      int 21h
      cmp cl,ch
      jne bot
      mov dl,10
      int 21h
      mov cl,0 
      inc ch 
      dec bl 
      cmp bl,5 
      jne topz 
      mov cl,0 
topd:
      inc cl 
      mov dl, 49 
      int 21h 
      cmp cl,bh 
      jne topd 
      mov dl,09 
      int 21h
      mov cl,0 

; display the second loop
bot1:
      inc cl
      mov dl,50
      int 21h
      cmp bh, cl
      jne bot1
      mov dl,10
      int 21h
      mov cl,0 
      inc bh 
      dec bl 
      cmp bl,0 
      jne topd 
      ret
nest endp




;triangle procedure 
tri1 PROC
            mov dl,10
            int 21h
            MOV BX,1
            MOV CX,5
    
   t1:
            PUSH CX
            MOV AH,2
            MOV DL,32
   t2:
            INT 21H
            LOOP t2   
            MOV CX,BX        
            MOV DL,'^' 
  t3:
            int 21h 
            loop t3
            mov ah,2
            mov dl,10
            int 21h
            mov dl,13
            int 21h 
            INC BX
            inc bx
            pop cx 
            loop t1   
            ret
tri1 ENDP
end main


                
       
