; Base Author: Megan Avery Spring 2024
; Exercise Author: Caleb Kress
; 
; Purpose - to learn about the following:
;	-  directives (dx, resx, & times)
;	- printing ints and characters
;	- dumping memory
;	- printing strings
;	- reading chars and ints

%include "asm_io.inc"

age equ 30            ; symbol
%define fav_number 34 ; macro

; initialized data (often used for declaring strings in code)
segment .data
; fav_color db "purple", 0 ; string
; letter db "A"            ; char
; number dd 95             ; int (dd = double word)
; name_num dd 67
; hello db "Hello World!", 0
; char_prompt db "Enter a character: ", 0
; int_prompt db "Enter an integer: ", 0
many_chars times 5 db "Z"

; uninitialized data (often used to reserve space for inputs)
segment .bss
; space_for_char resb 1   ; space for a character (one byte)
; space_for_number resd 1 ; space for one integer (one double word)


segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

	;mov dword [number], 116
	;mov eax, [number]
	; dump_regs 1

	;call print_int ; print number in base 10
	;call print_nl

	;mov ah, [letter]
	;call print_char

	; Exercise 1
	;mov eax, [name_num]
	;call print_int
	;call print_nl
	;call print_char

	; Exercise 2
	;mov eax, hello
	;call print_string
	;call print_nl
	;call dump_mem 1, hello, 2

	;mov eax, char_prompt
	;call print_string
	;call read_char
	;call print_nl
	;call print_char

	; Exercise 3
	;mov eax, char_prompt
	;call print_string
	;call read_char
	;mov byte [space_for_char], al
	;call read_int
	;mov dword [space_for_number], eax

        ; Exercise 4
        dump_mem 1, many_chars, 0
        call print_nl
        dump_mem 2, many_chars + 3, 0

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
