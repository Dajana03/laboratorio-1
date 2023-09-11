.data
prompt: .asciiz "Ingrese la cantidad de t�rminos de la Serie de Fibonacci: "
result_msg: .asciiz "Serie de Fibonacci: "
newline: .asciiz "\n"

.text
.globl main

main:
    # Pide al usuario la cantidad de t�rminos de la Serie de Fibonacci
    li $v0, 4
    la $a0, prompt
    syscall

    # Lee la cantidad de t�rminos ingresada por el usuario
    li $v0, 5
    syscall
    move $t0, $v0

    # Muestra el mensaje inicial de la Serie de Fibonacci
    li $v0, 4
    la $a0, result_msg
    syscall
    
   

    # Caso especial para la impresi�n de 0 t�rminos
    beqz $t0, end_fibonacci

    # Muestra el primer t�rmino (0) de la Serie de Fibonacci
    li $t1, 0
    li $v0, 1
    move $a0, $t1
    syscall
    # dejar espacio
    li $v0, 11
        li $a0, ' '
        syscall

    # Caso especial para la impresi�n de 1 t�rmino
    beq $t0, 1, end_fibonacci

    # Muestra una coma para separar los t�rminos
    li $v0, 4
    li $v0, 11
    syscall
    
    

    # Inicializa los primeros dos t�rminos de la Serie de Fibonacci
    li $t1, 0 # T�rmino n-2
    li $t2, 1 # T�rmino n-1

    # Muestra el segundo t�rmino (1) de la Serie de Fibonacci
    li $v0, 1
    move $a0, $t2
    syscall
    #dejar espacio
    li $v0, 11
        li $a0, ' '
        syscall

    # Verifica si solo se solicitaron dos t�rminos
    beq $t0, 2, end_fibonacci

    # Calcula y muestra los t�rminos restantes de la Serie de Fibonacci
    li $t3, 2 # �ndice del t�rmino actual (comienza en el tercer t�rmino)
    
    fibonacci_loop:
        # Calcula el siguiente t�rmino de Fibonacci: n = n-1 + n-2
        add $t3, $t3, 1
        add $t4, $t1, $t2
        move $t1, $t2
        move $t2, $t4

        # Muestra el t�rmino actual
        move $a0, $t4
        li $v0, 1
        syscall
        # dejar espacio
        li $v0, 11
        li $a0, ' '
        syscall

        # Verifica si se han mostrado suficientes t�rminos
        bne $t3, $t0, fibonacci_loop

    end_fibonacci:
    # Imprime una nueva l�nea y sale del programa
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall
