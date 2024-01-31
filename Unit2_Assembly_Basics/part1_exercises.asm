; 
; Base Author:  Megan Avery Spring 2024
; Exercise Author: Caleb Kress
; 
; Purpose - to learn about the following:
; 	- comments
;	- dumping registers
;	- printing empty lines
;	- instructions: mov, add, sub, inc/dec

%include "asm_io.inc"

; initialized data
segment .data

; uninitialized data
segment .bss


segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

        ; PART 1: Dumping Registers
        ; dump_regs 1
        ; call print_nl

        ; mov eax, 0 ; making EAX = 0
        ; mov ah, 18 ; AH = 18 (base 10)
        ; mov al, 0BAH ; AL = 0xBA (base 16)
        ; dump_regs 2

        ; mov eax, 0BEEFCAFEH ; EAX  = BEEFCAFE
        ; call print_nl
        ; dump_regs 3

        ; PART 2: MOV and ADD
        ; mov eax, 40 ; eax = 40
        ; dump_regs 1 ; dump registers
        ; call print_nl

        ; mov ebx, 2 ; ebx = 2
        ; dump_regs 2 ; dump registers
        ; call print_nl

        ; add eax, ebx ; eax += ebx, eax = 42
        ; dump_regs 3 ; dump registers

        ; PART 3: SUB, INC, and DEC 
        ; mov eax, 16 ; eax = 16
        ; dump_regs 1 ; dump registers
        ; mov ebx, 4 ; ebx = 4
        ; dump_regs 2 ; dump registers
        ; sub eax, ebx ; eax -= ebx, eax = 12
        ; dump_regs 3 ; dump registers
        ; mov ecx, eax ; ecx = eax
        ; dump_regs 4 ; dump registers
        ; inc ecx ; ecx += 1, ecx = 13
        ; dump_regs 5; dump registers

        ; PART 4: Exercise - multiply 12 by 4
        ; mov eax, 12 ; eax = 12
        ; add eax, eax ; eax = 24
        ; add eax, eax ; eax = 48
        ; dump_regs 1 ; dump registers

        ; PART 5: Exercise - multiply 4 by 12
        mov eax, 4 ; eax = 4
        add eax, eax ; eax = 8
        add eax, eax ; eax = 16
        mov ebx, eax ; ebx = 16
        add eax, ebx ; eax = 32
        add eax, ebx ; eax = 48
        dump_regs 1 ; dump registers


        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


