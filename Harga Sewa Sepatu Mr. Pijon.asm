.model small
.code
org 100h
start:
         jmp mulai
nama         db 13,10,'Nama Customer   : $'
hp           db 13,10,'No.Antrian      : $'
lanjut       db 13,10,'Tekan y untuk menyewa : $'
ininama   db 30,?,30 dup(?)
antri     db 13,?,13 dup(?)   
masukkan  db 13,10,'Silahkan Masukkan Tipe yang Anda pilih: $'
      
daftar db 13,10,'+-----------------------------------------------+'
       db 13,10,'|     DAFTAR HARGA SEWA SEPATU Mr.Pijon         |'
       db 13,10,'+-----------------------------------------------+'
       db 13,10,'|NO| NAMA              | HARGA         | Waktu  |'
       db 13,10,'+-----------------------------------------------+'          
       db 13,10,'|1 | Sepatu PDH        | RP.500.000    | 1 hari |'
       db 13,10,'+-----------------------------------------------+'
       db 13,10,'|2 | Sepatu Boot       | RP.400.000    | 1 hari |'
       db 13,10,'+-----------------------------------------------+'
       db 13,10,'|3 | Sepatu Ventela    | RP.700.000    | 1 hari |'
       db 13,10,'+-----------------------------------------------+'
       db 13,10,'|4 | Sepatu Nike       | RP.750.000    | 1 hari |'
       db 13,10,'+-----------------------------------------------+'
       db 13,10,'|5 | Sepatu Adidas     | RP.800.000    | 1 hari |'
       db 13,10,'+-----------------------------------------------+','$'
    mulai:
        mov ah,09h
        lea dx,nama
        int 21h
        mov ah,0ah
        lea dx,ininama
        int 21h
        push dx  
        
        mov ah,09h
        lea dx,hp
        int 21h
        mov ah,0ah
        lea dx,antri
        int 21h
        push dx
       mov ah,09h
	 mov dx,offset daftar
	 int 21h
	 mov ah,09h
	 mov dx,offset lanjut
	 int 21h
	 mov ah,01h
	 int 21h
	 cmp al,'y'
	 jmp proses
	 jne error_msg
error_msg:
        mov ah,09h
        mov dx,offset error_msg
        int 21h
        int 20h
proses:
        mov ah,09h
        mov dx,offset masukkan
        int 21h
        mov ah,01
        int 21h
        mov bh,al
       
       
        cmp al,'1'
        je hasil1
        
        cmp al,'2'
        je hasil2
        
        cmp al,'3'
        je hasil3
        
        cmp al,'4'
        je hasil4
        
        cmp al,'5'
        je hasil5   
        
hasil1:
	mov ah,09h
	lea dx,pil1
	int 21h
	int 20h
hasil2:
	mov ah,09h
	lea dx,pil2
	int 21h
	int 20h
hasil3:
	mov ah,09h
	lea dx,pil3
	int 21h
	int 20h
	
hasil4:
	mov ah,09h
	lea dx,pil4
	int 21h
	int 20h  
hasil5:
	mov ah,09h
	lea dx,pil5
	int 21h
	int 20h
       
;-----------------------------------------------------------------------------------------
pil1  db 13,10,'Anda menyewa Sepatu PDH'
       db 13,10,'Total Harga Yang Harus Anda Bayar : RP.500.000'
       db 13,10,'Terima Kasih $'
pil2  db 13,10,'Anda menyewa Sepatu Boot'
       db 13,10,'Total Harga Yang Harus Anda Bayar : RP.400.000'
       db 13,10,'Terima Kasih $'
pil3  db 13,10,'Anda menyewa Sepatu Ventela'
       db 13,10,'Total Harga Yang Harus Anda Bayar : RP.700.000'
       db 13,10,'Terima Kasih $'
pil4  db 13,10,'Anda menyewa Sepatu Nike'
       db 13,10,'Total Harga Yang Harus Anda Bayar : RP.750.000'
       db 13,10,'Terima Kasih $'
pil5  db 13,10,'Anda menyewa Sepatu Adidas'
       db 13,10,'Total Harga Yang Harus Anda Bayar : RP.800.000'  
       db 13,10,'Terima Kasih $'