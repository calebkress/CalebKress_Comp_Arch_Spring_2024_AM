; Original Author: Paul Carter
; Updated by: Megan Avery Summer 2023
; 
; Purpose: Project 3 - rewrites some basic C mathematical operations in assembly

%include "asm_io.inc"

; initialized data
segment .data
inputMsg db "Enter your favorite number: ", 0  ; input prompt
startMsg db "Starting number: ", 0             ; starting num message
times10Msg db "Number * 10: ", 0               ; times 10 message
times72Msg db "Number * 72: ", 0               ; times 72 message
times81Msg db "Number * 81: ", 0               ; times 81 message

; uninitialized data
segment .bss
starting_number resd 1
result resd 1

segment .text
        global  asm_main
asm_main:
        enter   0,0                ; setup routine
        pusha

	; get and display user input
        mov eax, inputMsg           ; load input address into eax
        call print_string           ; print input prompt
        call read_int               ; read input
        mov [starting_number], eax  ; store starting num in eax
        mov eax, startMsg           ; move starting num message to eax
        call print_string           ; display starting num message
        mov eax, [starting_number]  ; store starting num in eax
        call print_int              ; display value of starting num
        call print_nl               ; print newline character

        ; calculate num * 10
        mov ebx, [starting_number]  ; store starting num in ebx
        add eax, ebx                ; eax = starting num * 2
        add eax, eax                ; eax = starting num * 4
        mov ecx, eax                ; store num * 4 in ecx (for times 72)
        add eax, ebx                ; eax = starting num * 5
        add eax, eax                ; eax = starting num * 10
        mov edx, eax                ; store num * 10 in edx (for times 72)
        mov [result], eax           ; store eax in result
        mov eax, times10Msg         ; move times 10 message to eax
        call print_string           ; display times 10 message
        mov eax, [result]           ; move result to eax
        call print_int              ; display result of starting num * 10
        call print_nl               ; print newline character

        ; calculate num * 72
        add ecx, ecx                ; ecx = starting num * 8
        mov eax, edx                ; eax = starting num * 10
        add eax, eax                ; eax = starting num * 20
        add eax, eax                ; eax = starting num * 40
        add eax, eax                ; eax = starting num * 80
        mov edx, eax                ; store num * 80 in edx (for extension)
        sub eax, ecx                ; eax (num * 80) - ecx (num * 8) = num * 72
        mov [result], eax           ; store eax in result
        mov eax, times72Msg         ; move times 10 message to eax
        call print_string           ; display times 10 message
        mov eax, [result]           ; move result to eax
        call print_int              ; display result of starting num * 10
        call print_nl               ; print newline character

        ; calculate num * 81
        mov eax, [starting_number]  ; store starting num in eax
        add eax, edx                ; eax (num) + edx (num * 80) = num * 81
        mov [result], eax           ; store eax in result
        mov eax, times81Msg         ; move times 10 message to eax
        call print_string           ; display times 10 message
        mov eax, [result]           ; move result to eax
        call print_int              ; display result of starting num * 10
        call print_nl               ; print newline character

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


