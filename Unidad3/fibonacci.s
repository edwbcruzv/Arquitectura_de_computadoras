.data            # Zona de datos
vector: .word 0 100
      .text      # Zona de instrucciones
main: li $v0, 1  # Llamada al sistema para print int
      lw $a0, vector ($0) #vector[0] se guarda en $a0, $sa = 0
      addi $s0, $a0, 0  #$s0 = $a0 + 0
      syscall
      lw $a0, vector + 4($0)
      addi $s1, $a0, 0 #$s1 = $a0 + 0
      #syscall
      #addi $a0, $s0, 1
      #syscall    # Muestra el segundo número en pantalla
      li $s5,2 #$s5 = 2
	ble $s1 , $s5 , fin
	li $s3 , 1 #$s3 = 1
loop: 
      #zona del swap
      add $s4, $s0, $s3  #$s4 = $s0 + $s3 
      addi $a0 , $s4 , 0  #$a0 = $s4 + 0  
	addi $s3 , $s0 , 0  #$s3 = $s0 + 0
	addi $s0 , $s4 , 0  #$s0 = $a4 + 0
      syscall

      addi $s5 , $s5 , 1
      blt $s5, $s1, loop
      li $v0, 10 #termina el ciclo y se pasa al siguiente numero
      syscall

      li $v0, 10 # Finalizarprograma
      syscall

fin:
	sub $a0, $s5, 1 
	syscall
	li $v0, 10 # Finalizarprograma
      syscall