# Declaración de variables
    .data
num1:   .word   0
num2:   .word   0
num3:   .word   0
msg1:   .asciiz "Ingrese el primer número: "
msg2:   .asciiz "Ingrese el segundo número: "
msg3:   .asciiz "Ingrese el tercer número: "
msg4:   .asciiz "El número menor es: "
 
    .text
    .globl main

main:
    # Pedir al usuario que ingrese el primer número
    li $v0, 4
    la $a0, msg1
    syscall
 
    # Leer el primer número y guardarlo en num1
    li $v0, 5
    syscall
    sw $v0, num1
 
    # Pedir al usuario que ingrese el segundo número
    li $v0, 4
    la $a0, msg2
    syscall
 
    # Leer el segundo número y guardarlo en num2
    li $v0, 5
    syscall
    sw $v0, num2
 
    # Pedir al usuario que ingrese el tercer número
    li $v0, 4
    la $a0, msg3
    syscall
 
    # Leer el tercer número y guardarlo en num3
    li $v0, 5
    syscall
    sw $v0, num3
 
    # Encontrar el número menor
    lw $t0, num1
    lw $t1, num2
    lw $t2, num3
 
    slt $t3, $t0, $t1
    beq $t3, 1, menor1
    move $t0, $t1
menor1:
    slt $t3, $t0, $t2
    beq $t3, 1, imprimir
 
    move $t0, $t2
imprimir:
    # Imprimir el número menor
    li $v0, 4
    la $a0, msg4
    syscall
 
    li $v0, 1
    move $a0, $t0
    syscall
 
    # Terminar el programa
    li $v0, 10
    syscall