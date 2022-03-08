.data            # Zona de datos
vector: .word 34 28

      .text      # Zona de instrucciones
main: li $v0, 1  # Llamada al sistema para print int
      lw $a0, vector ($0)
      addi $s0, $a0, 0
      syscall
      lw $a0, vector + 4($0)
      addi $s1, $a0, 0
      syscall
      sub $a0, $s1, $s0
      syscall    # Muestra el segundo número en pantalla


      li $v0, 10 # Finalizarprograma
      syscall