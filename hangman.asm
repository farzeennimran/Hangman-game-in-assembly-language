[org 0x0100]             

jmp start

message1: db 'HANGMAN', 0
message2: db ' Guess the four letter word ! ', 0
message3: db '_    _    _    _ ', 0
message4: db 'MADE BY FARZEEN IMRAN', 0
message5: db '--------------------------------------------------------------------------------', 0
message6: db 'YOU WIN !', 0
message7: db 'YOU LOSE !', 0
message8: db 'Press Enter key to Start the Game', 0
message9: db 'Press Esc key to Exit the Game', 0
message10: db 'You Exited the Game', 0
message11: db 'Press p to Play Again or Press Esc to Exit', 0 
message12:  db 'The word was : ', 0
string1: db 'coal'
w1: db 'moon'
w2: db 'dove'
w3: db 'love'
w4: db 'blue'
w5: db 'lake'
w6: db 'wisp'
w7: db 'lava' 
w8: db 'cold'
w9: db 'dark'
w10: db 'mars'
guessed: db 0
life: db 4
location: db 0
randNum: dw 0


;------------------------------------------------------------------------------------------------------------------------------------------

clrscr2:
push es
push ax
push di
mov ax,0xb800
mov es,ax
mov di,0

next2:
mov word[es:di],0x0720
add di,2
cmp di,4000
jne next2
pop di
pop ax
pop es

ret

;------------------------------------------------------------------------------------------------------------------------------------------

clrscr:
push es
push ax
push di
mov ax,0xb800
mov es,ax
mov di,0

next:
mov word[es:di],0x3020
add di,2
cmp di,4000
jne next
pop di
pop ax
pop es

ret

;------------------------------------------------------------------------------------------------------------------------------------------

strlen2:
push bp
mov bp,sp
push es
push cx
push di

mov ax, 4

pop di
pop cx
pop es
pop bp

ret 4

;------------------------------------------------------------------------------------------------------------------------------------------

strlen:
push bp
mov bp,sp
push es
push cx
push di
les di, [bp+4]
mov cx, 0xffff
xor al, al
repne scasb
mov ax, 0xffff 
sub ax, cx 
dec ax
pop di
pop cx
pop es
pop bp

ret 4

;------------------------------------------------------------------------------------------------------------------------------------------

printstr2:
push bp
mov bp, sp
push es
push ax
push cx
push si
push di
push ds
mov ax, [bp+4]
push ax 
call strlen2
cmp ax, 0
jz exit2
mov cx, 4
mov ax, 0xb800
mov es, ax 
mov al, 80 
mul byte [bp+8]
add ax, [bp+10]
shl ax, 1 
mov di, ax 
mov si, [bp+4] 
mov ah, [bp+6]
cld

nextchar2: 
lodsb 
stosw
loop nextchar2

exit2: 
pop di
pop si
pop cx
pop ax
pop es
pop bp

ret 8

;------------------------------------------------------------------------------------------------------------------------------------------

printstr:
push bp
mov bp, sp
push es
push ax
push cx
push si
push di
push ds
mov ax, [bp+4]
push ax 
call strlen
cmp ax, 0
jz exit
mov cx, ax 
mov ax, 0xb800
mov es, ax 
mov al, 80 
mul byte [bp+8]
add ax, [bp+10]
shl ax, 1 
mov di, ax 
mov si, [bp+4] 
mov ah, [bp+6]
cld

nextchar: 
lodsb 
stosw
loop nextchar

exit: 
pop di
pop si
pop cx
pop ax
pop es
pop bp

ret 8

;----------------------------------------------------------------------------------------------------------------------------------------

hangman:
push ax
push bx
push cx
push dx
push di
push si	
mov ax, 0xb800
mov es, ax
mov ax, 0
mov al, 0x20
mov ah, 0x77

mov di,44
mov word[es:di],ax
mov di,204
mov word[es:di],ax
mov di,364
mov word[es:di],ax
mov di,206
mov word[es:di],ax
mov di,208
mov word[es:di],ax
mov di,50
mov word[es:di],ax
mov di,210
mov word[es:di],ax
mov di,370
mov word[es:di],ax

mov di,54
mov word[es:di],ax
mov di,214
mov word[es:di],ax
mov di,374
mov word[es:di],ax
mov di,56
mov word[es:di],ax
mov di,58
mov word[es:di],ax
mov di,218
mov word[es:di],ax
mov di,378
mov word[es:di],ax

mov di,62
mov word[es:di],ax
mov di,222
mov word[es:di],ax
mov di,382
mov word[es:di],ax
mov di,64
mov word[es:di],ax
mov di,226
mov word[es:di],ax
mov di,70
mov word[es:di],ax
mov di,230
mov word[es:di],ax
mov di,388
mov word[es:di],ax
mov di,390
mov word[es:di],ax

mov di,74
mov word[es:di],ax
mov di,76
mov word[es:di],ax
mov di,234
mov word[es:di],ax
mov di,394
mov word[es:di],ax
mov di,394
mov word[es:di],ax
mov di,396
mov word[es:di],ax
mov di,556
mov word[es:di],ax

mov di,80
mov word[es:di],ax
mov di,240
mov word[es:di],ax
mov di,400
mov word[es:di],ax
mov di,82
mov word[es:di],ax
mov di,244
mov word[es:di],ax
mov di,86
mov word[es:di],ax
mov di,88
mov word[es:di],ax
mov di,248
mov word[es:di],ax
mov di,408
mov word[es:di],ax

mov di,92
mov word[es:di],ax
mov di,252
mov word[es:di],ax
mov di,412
mov word[es:di],ax
mov di,94
mov word[es:di],ax
mov word[es:di],ax
mov di,96
mov word[es:di],ax
mov di,256
mov word[es:di],ax
mov di,416
mov word[es:di],ax

mov di,100
mov word[es:di],ax
mov di,102
mov word[es:di],ax
mov di,260
mov word[es:di],ax
mov di,420
mov word[es:di],ax
mov di,264
mov word[es:di],ax
mov di,108
mov word[es:di],ax
mov di,426
mov word[es:di],ax
mov di,428
mov word[es:di],ax
mov di,268
mov word[es:di],ax

pop si
pop di
pop dx
pop cx
pop bx
pop ax
ret

;------------------------------------------------------------------------------------------------------------------------------------------

stickman:
push ax
push bx
push cx
push dx
push di
push si
	
mov ax, 0xb800
mov es,ax
mov ax,0
mov al,0x20
mov ah,0x7E

mov di, 1566
mov word[es:di], ax
mov di, 1568
mov word[es:di], ax
mov di, 1570
mov word[es:di], ax
mov di, 1574
mov word[es:di], ax
mov di, 1572
mov word[es:di], ax
mov di, 1726
mov word[es:di], ax
mov di,1728
mov word[es:di],ax
mov di, 1730
mov word[es:di], ax
mov di, 1732
mov word[es:di], ax
mov di, 1734
mov word[es:di], ax

mov ah, 0x4C

mov di,2050
mov word[es:di],ax
mov di,2048
mov word[es:di],ax
mov di,2052
mov word[es:di],ax

mov di,2210
mov word[es:di],ax
mov di,2212
mov word[es:di],ax
mov di,2208
mov word[es:di],ax

mov di,2370
mov word[es:di],ax
mov di,2372
mov word[es:di],ax
mov di,2368
mov word[es:di],ax


mov di,1892
mov word[es:di],ax
mov di,1890
mov word[es:di],ax
mov di,1888
mov word[es:di],ax

mov ah, 0x07

mov di,1410
mov word[es:di],ax
mov di,1250
mov word[es:di],ax
mov di,1090
mov word[es:di],ax
mov di,1092
mov word[es:di],ax
mov di,1094
mov word[es:di],ax
mov di,1096
mov word[es:di],ax
mov di,1098
mov word[es:di],ax
mov di,1100
mov word[es:di],ax
mov di,1102
mov word[es:di],ax
mov di,1104
mov word[es:di],ax
mov di,1106
mov word[es:di],ax
mov di,1108
mov word[es:di],ax
mov di,1110
mov word[es:di],ax
mov di,1112
mov word[es:di],ax
mov di,1114
mov word[es:di],ax
mov di,1116
mov word[es:di],ax
mov di,1118
mov word[es:di],ax

mov al, '*'
mov ah, 0x7F
mov di,1568
mov word[es:di],ax
mov di,1572
mov word[es:di],ax
 
mov al, '-'
mov di,1730
mov word[es:di],ax

pop si
pop di
pop dx
pop cx
pop bx
pop ax
ret

;------------------------------------------------------------------------------------------------------------------------------------------

updateStr:
push ax
push dx
push si
push di

mov ax, 0
cmp word[randNum],0
je str1

cmp word[randNum],1
je str2

cmp word[randNum],2
je str3

cmp word[randNum],3
je str4

cmp word[randNum],4
je str5

cmp word[randNum],5
je str6

cmp word[randNum],6
je str7

cmp word[randNum],7
je str8

cmp word[randNum],8
je str9

cmp word[randNum],9
je str10
jmp retUpdateStr

str1:
mov si, 0
mov di, 0
mov bx, string1
str1l1:
mov ax, [w1+di]
mov [bx+si], ax
inc si
inc di
cmp si, 4
jne str1l1
jmp retUpdateStr

str2:
mov si, 0
mov di, 0
mov bx, string1
str2l1:
mov ax, [w2+di]
mov [bx+si], ax
inc si
inc di
cmp si, 4
jne str2l1
jmp retUpdateStr

str3:
mov si, 0
mov di, 0
mov bx, string1
str3l1:
mov ax, [w3+di]
mov [bx+si], ax
inc si
inc di
cmp si, 4
jne str3l1
jmp retUpdateStr

str4:
mov si, 0
mov di, 0
mov bx, string1
str4l1:
mov ax, [w4+di]
mov [bx+si], ax
inc si
inc di
cmp si, 4
jne str4l1
jmp retUpdateStr

str5:
mov si, 0
mov di, 0
mov bx, string1
str5l1:
mov ax, [w5+di]
mov [bx+si], ax
inc si
inc di
cmp si, 4
jne str5l1
jmp retUpdateStr

str6:
mov si, 0
mov di, 0
mov bx, string1
str6l1:
mov ax, [w6+di]
mov [bx+si], ax
inc si
inc di
cmp si, 4
jne str6l1
jmp retUpdateStr

str7:
mov si, 0
mov di, 0
mov bx, string1
str7l1:
mov ax, [w7+di]
mov [bx+si], ax
inc si
inc di
cmp si, 4
jne str7l1
jmp retUpdateStr

str8:
mov si, 0
mov di, 0
mov bx, string1
str8l1:
mov ax, [w8+di]
mov [bx+si], ax
inc si
inc di
cmp si, 4
jne str8l1
jmp retUpdateStr

str9:
mov si, 0
mov di, 0
mov bx, string1
str9l1:
mov ax, [w9+di]
mov [bx+si], ax
inc si
inc di
cmp si, 4
jne str9l1
jmp retUpdateStr

str10:
mov si, 0
mov di, 0
mov bx, string1
str10l1:
mov ax, [w10+di]
mov [bx+si], ax
inc si
inc di
cmp si, 4
jne str10l1
jmp retUpdateStr

retUpdateStr:
pop di
pop si
pop dx
pop ax
ret

;------------------------------------------------------------------------------------------------------------------------------------------

GenRandNum:
push ax
push bx
push cx
push dx

MOV AH, 00h
INT 1AH 
mov ax, dx
xor dx, dx
mov cx, 10
div cx

mov word[randNum], dx

pop dx
pop cx
pop bx
pop ax
ret

;------------------------------------------------------------------------------------------------------------------------------------------

print:
push ax
push di
push es
push dx
mov dl, al
mov ax, 0xb800
mov es, ax
mov dh, 0x3C

cmp byte[location], 0
je loc1

cmp byte[location], 1
je loc2

cmp byte[location], 2
je loc3

cmp byte[location], 3
je loc4

loc1:
mov [es:1782], dx
jmp retPrint

loc2:
mov [es:1796], dx
jmp retPrint

loc3:
mov [es:1810], dx
jmp retPrint

loc4:
mov [es:1824], dx
jmp retPrint

retPrint:
pop dx
pop es
pop di
pop ax

ret

;------------------------------------------------------------------------------------------------------------------------------------------

printPart:
push ax	
mov ax, 0xb800
mov es, ax
mov ax, 0
mov al, 0x20
mov ah, 0x7E

cmp byte[life], 3
je rightarm

cmp byte[life], 2
je leftarm

cmp byte[life], 1
je rightleg

cmp byte[life], 0
je leftleg
jmp retprintpart

rightarm:
mov di, 2054
mov word[es:di], ax
mov di, 2056
mov word[es:di], ax
jmp retprintpart

rightleg:
mov di,2374
mov word[es:di], ax
mov di,2376
mov word[es:di],ax
jmp retprintpart

leftarm:
mov di, 2046
mov word[es:di], ax
mov di, 2044
mov word[es:di], ax
jmp retprintpart

leftleg:
mov di, 2366
mov word[es:di], ax
mov di, 2364
mov word[es:di], ax
jmp retprintpart

retprintpart:
pop ax

ret

;------------------------------------------------------------------------------------------------------------------------------------------

wingamescr:
call clrscr2
mov ax, 34
push ax
mov ax, 9
push ax
mov ax, 0xE
push ax
mov ax, message6
push ax
call printstr
mov ax, 18
push ax
mov ax, 13
push ax
mov ax, 0xE
push ax
mov ax, message11
push ax
call printstr
mov ax, 28
push ax
mov ax, 11
push ax
mov ax, 0xE
push ax
mov ax, message12
push ax
call printstr
mov ax, 44
push ax
mov ax, 11
push ax
mov ax, 8
push ax
mov ax, string1
push ax
call printstr2

call keyPressed

ret 32

;------------------------------------------------------------------------------------------------------------------------------------------

endgamescr:
call clrscr2
mov ax, 34
push ax
mov ax, 9
push ax
mov ax, 0xE
push ax
mov ax, message7
push ax
call printstr
mov ax, 18
push ax
mov ax, 13
push ax
mov ax, 0xE
push ax
mov ax, message11
push ax
call printstr
mov ax, 28
push ax
mov ax, 11
push ax
mov ax, 0xE
push ax
mov ax, message12
push ax
call printstr
mov ax, 44
push ax
mov ax, 11
push ax
mov ax, 8
push ax
mov ax, string1
push ax
call printstr2

call keyPressed

ret 32

;------------------------------------------------------------------------------------------------------------------------------------------

checkInputInStr:
push si
push cx
push bx
mov cx, 4
mov si, 0
mov bx, 0

compare:
mov [location], si
cmp al, [string1 + si]
je found
add si, 1
sub cx, 1
cmp cx, 0
je retCheckInputInStr
jmp compare

found:
call print
add byte[guessed], 1
mov bx, 1
add si, 1
sub cx, 1
cmp cx, 0
jne compare

retCheckInputInStr:
cmp bx, 0
je check_life
jmp retCheckIn

check_life:
sub byte[life], 1
call printPart
cmp byte[life], 0
je end_game
jmp retCheckIn

end_game:
call endgamescr
jmp retCheckIn

win_game:
call wingamescr
jmp retCheckIn

retCheckIn:
cmp byte[guessed], 4
je win_game
pop bx
pop cx
pop si
ret

;------------------------------------------------------------------------------------------------------------------------------------------

startscreen:
call clrscr
call hangman
call stickman
call GenRandNum
call updateStr 
mov ax, 7
push ax
mov ax, 7
push ax
mov ax, 0x3C
push ax
mov ax, message2
push ax
call printstr
mov ax, 10
push ax
mov ax, 12
push ax
mov ax, 0x3C
push ax
mov ax, message3
push ax
call printstr
mov ax, 0
push ax
mov ax, 18
push ax
mov ax, 0x3C
push ax
mov ax, message5
push ax
call printstr
mov ax, 56
push ax
mov ax, 22
push ax
mov ax, 0x3C
push ax
mov ax, message4
push ax
call printstr

call keyPressed2

ret 32

;------------------------------------------------------------------------------------------------------------------------------------------

endscreen:
call clrscr2
mov ax, 30
push ax
mov ax, 10
push ax
mov ax, 0xE
push ax
mov ax, message10
push ax
call printstr

ret 8

;------------------------------------------------------------------------------------------------------------------------------------------

keyPressed2:

check2:
mov ah, 1h
int 21h

cmp al, 0x60
jbe retKeyPressed2
cmp al, 0x7B
jae retKeyPressed2
call checkInputInStr
cmp byte[life], 0
je retKeyPressed2
cmp byte[guessed], 4
je retKeyPressed2
jmp check2

retKeyPressed2:
ret

;------------------------------------------------------------------------------------------------------------------------------------------

keyPressed:

mov ah, 1h
int 21h

cmp al, 0x0D
je startscr
cmp al, 0x70
je playagain
cmp al, 0x1B
je endscr
jmp retKeyPressed

startscr:
call startscreen
jmp retKeyPressed

playagain:
mov byte[life], 4
mov byte[location], 0
mov byte[guessed], 0
call startscreen
jmp retKeyPressed

endscr:
call endscreen
jmp retKeyPressed

retKeyPressed:
ret

;------------------------------------------------------------------------------------------------------------------------------------------

mainscreen:
mov ax, 56
push ax
mov ax, 22
push ax
mov ax, 7
push ax
mov ax, message4
push ax
call printstr
mov ax, 23
push ax
mov ax, 10
push ax
mov ax, 0xE
push ax
mov ax, message8
push ax
call printstr
mov ax, 25
push ax
mov ax, 12
push ax
mov ax, 0xE
push ax
mov ax, message9
push ax
call printstr

ret 24

;------------------------------------------------------------------------------------------------------------------------------------------

start:
call clrscr2

call hangman

call mainscreen

call keyPressed

terminate:
mov ax, 0x4c00 
int 0x21