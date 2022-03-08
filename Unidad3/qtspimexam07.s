.data            # Zona de datos
vector: .word 4 4

      .text      # Zona de instrucciones
main: li $v0, 1  # Llamada al sistema para print int
      lw $a0, vector ($0)
      addi $s0, $a0, 0
      syscall
      lw $a0, vector + 4($0)
      addi $s1, $a0, -5
      syscall
      mul $a0, $s0, $s1
      syscall    # Muestra el segundo número en pantalla


      li $v0, 10 # Finalizarprograma
      syscall