.data
prompt1: .asciiz "Ingrese el primer n�mero: "
prompt2: .asciiz "Ingrese el segundo n�mero: "
prompt3: .asciiz "Ingrese el tercer n�mero: "
result_msg: .asciiz "El n�mero mayor es: "
newline: .asciiz "\n"
buffer: .space 32

.text
.globl main

main:
    # Pide al usuario que ingrese el primer n�mero
    li $v0, 4
    la $a0, prompt1
    syscall

    # Lee el primer n�mero
    li $v0, 5
    syscall
    move $t0, $v0

    # Pide al usuario que ingrese el segundo n�mero
    li $v0, 4
    la $a0, prompt2
    syscall

    # Lee el segundo n�mero
    li $v0, 5
    syscall
    move $t1, $v0

    # Pide al usuario que ingrese el tercer n�mero
    li $v0, 4
    la $a0, prompt3
    syscall

    # Lee el tercer n�mero
    li $v0, 5
    syscall
    move $t2, $v0

    # Encuentra el n�mero mayor
    move $t3, $t0

    # Compara con el segundo n�mero
    blt $t1, $t3, check_t1
    move $t3, $t1

check_t1:
    # Compara con el tercer n�mero
    blt $t2, $t3, output_result
    move $t3, $t2

output_result:
    # Muestra el resultado del n�mero mayor
    li $v0, 4
    la $a0, result_msg
    syscall

    # Muestra el resultado como un entero
    move $a0, $t3
    li $v0, 1
    syscall

    # Imprime una nueva l�nea
    li $v0, 4
    la $a0, newline
    syscall

    # Sale del programa
    li $v0, 10
    syscall
