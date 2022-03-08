library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packageram00.all;


entity ram00 is
	port(
		clk_0:inout std_logic; --salida de reloj
		div_0:in std_logic_vector(4 downto 0); --selector de frecuencia de reloj
		reset_0:in std_logic;	--reset
		rw_0:in std_logic;	--rw
		load_0:in std_logic;	--load
		in_key_0:in std_logic_vector(3 downto 0); --entrada de columnas de la matriz
		out_key_0:inout std_logic_vector(3 downto 0); --salida a las filas de la matrix
		out_cont_write_0:inout std_logic_vector(5 downto 0); --contadores de escritura --sin uso externo
		out_cont_read_0:inout std_logic_vector(5 downto 0); --contadores de lectura --sin uso externo
		out_word_0:inout std_logic_vector(7 downto 0); --salida del codigo de display
		out_transit_0:out std_logic_vector(3 downto 0)); --salida a transistores de display
end ram00;

architecture ram0 of ram00 is
signal S_flag :std_logic;
signal S_word :std_logic_vector(7 downto 0);
signal S_word_memram_to_muxram :std_logic_vector(7 downto 0);

begin


	out_transit_0 <= "1110";
	
		RAM00: osc00 port map(div_osc => div_0,clk_osc => clk_0); --listo
	
	CODER: coder00 port map(clk_coder => clk_0, --entrada de seï¿½al de reloj
			reset => reset_0,--reset de la matriz
			rw => rw_0,--rw de la matriz
			in_key => in_key_0,--Entrada del contador de anillo, nos indica el turno de la fila
			out_key => out_key_0,--Salida hacia el teclado matricial, indica el turno de la columna
			out_word => S_word ,--Salida del display 
			out_cont_write => out_cont_write_0,--contador de escritura, le dira a contRead que tecla se pulsa
			out_flag => S_flag);--bandera  de control, cada que se pulse un boton se activa y a su vez activa a la RAM
	
	COUNTRING: contring00 port map(
			clk_cr => clk_0,--entrada de señal de reloj
			load => load_0,--activacion del contador
			out_contring => out_key_0); --salida hacia la fila de la matriz en turno
			
	MEMRAM: memram00 port map(
			clk_memram => clk_0,--entrada de reloj
			reset => reset_0,--reset de la ram
			rw => rw_0,--rw de la ram
			in_flag => S_flag,--entrada de bandera, activacion de la ram
			in_word => S_word,--entrada del codigo de display del numero, este se almacena
			in_cont_write => out_cont_write_0,--entrada de contador de escritura
			in_cont_read => out_cont_read_0,--entrada de contador de rectura
			out_word => S_word_memram_to_muxram); --salida de de lectura,sale el codigo del display del numero		
			
	COUNREAD: contRead00 port map(
			clk_contRead => clk_0,--entrada de reloj
			reset => reset_0,--reset del contador
			rw => rw_0,--rw del contador
			in_cont_write => out_cont_write_0,--entrada de contador de escritura,servira como tope de control de escritura
			out_contRead => out_cont_read_0);--salida de contador de escritura		
			
	MUXRAM: muxram00 port map(
			reset => reset_0,--reset de muxram
			rw => rw_0,--rw de musram
			in_word_coder => S_word,--entrada que viene del coder, codigo del display
			in_word_memram => S_word_memram_to_muxram,--entrada que viene de memram
			out_word => out_word_0 );--salida de codigo de display que se solicito por teclado matricial		
		
end ram0;