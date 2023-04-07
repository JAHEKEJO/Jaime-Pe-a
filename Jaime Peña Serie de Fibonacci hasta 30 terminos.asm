
# Serie De Fibonacci Programada para máximo 30 términos

.data
    msg1: .asciiz "Ingrese el número de términos de la serie de Fibonacci a calcular: "
    msg2: .asciiz "Los términos de la serie de Fibonacci solicitados son: "
    newline: .asciiz "\n"
    
.text
    # Imprimir mensaje para solicitar número de términos a calcular
    li $v0, 4
    la $a0, msg1
    syscall
    
    # Leer número de términos a calcular
    li $v0, 5
    syscall
    move $s0, $v0 # Guardar número de términos en registro $s0
    
    # Imprimir mensaje con los primeros 10 términos de la serie de Fibonacci
    li $v0, 4
    la $a0, msg2
    syscall
    
    # Calcular los primeros 10 términos de la serie de Fibonacci
    li $t0, 0 # Término actual
    li $t1, 1 # Siguiente término
    li $t2, 0 # Contador de términos calculados
    
    fibonacci:
        bge $t2, 30, end_fibonacci # Salir del bucle si se han calculado 10 términos
        add $t3, $t0, $t1 # Calcular siguiente término
        move $t0, $t1 # Mover valores para el siguiente cálculo
        move $t1, $t3
        addi $t2, $t2, 1 # Incrementar contador de términos calculados
        move $a0, $t0 # Imprimir término actual
        li $v0, 1
        syscall
        li $v0, 4 # Imprimir separador
        la $a0, newline
        syscall
        j fibonacci
    
    end_fibonacci:
        li $v0, 30 # Salir del programa
        syscall