(Scripts)
# Declaración de variables
    .data
num1:   .word   0
num2:   .word   0
num3:   .word   0
msg1:   .asciiz "Ingrese el primer número: "
msg2:   .asciiz "Ingrese el segundo número: "
msg3:   .asciiz "Ingrese el tercer número: "
msg4:   .asciiz "El número mayor es: "
    
    .text
    .globl main
    
main:
    # Pedir al usuario que ingrese el primer número
    li      $v0, 4
    la      $a0, msg1
    syscall
    
    # Leer el primer número ingresado por el usuario
    li      $v0, 5
    syscall
    sw      $v0, num1
    
    # Pedir al usuario que ingrese el segundo número
    li      $v0, 4
    la      $a0, msg2
    syscall
    
    # Leer el segundo número ingresado por el usuario
    li      $v0, 5
    syscall
    sw      $v0, num2
    
    # Pedir al usuario que ingrese el tercer número
    li      $v0, 4
    la      $a0, msg3
    syscall
    
    # Leer el tercer número ingresado por el usuario
    li      $v0, 5
    syscall
    sw      $v0, num3
    
    # Comparar los números para encontrar el mayor
    lw      $t0, num1
    lw      $t1, num2
    bgt     $t0, $t1, check_num1
    
    lw      $t0, num2
check_num1:
    lw      $t1, num3
    bgt     $t0, $t1, print_num1
    
    lw      $t0, num3
print_num1:
    # Imprimir el número mayor
    li      $v0, 4
    la      $a0, msg4
    syscall
    
    li      $v0, 1
    move    $a0, $t0
    syscall
    
    # Salir del programa
    li      $v0, 10
    syscall
#Finaliza Script Número mayor
