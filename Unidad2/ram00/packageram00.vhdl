library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

package packageram00 is

	component osc00
		port(div_osc :in std_logic_vector(4 downto 0);
			clk_osc:inout std_logic);
	end component;
	
	component coder00 
		port(clk_coder:in std_logic; --entrada de se�al de reloj
			reset:in std_logic; --reset de la matriz
			rw:in std_logic;	--rw de la matriz
			in_key: in std_logic_vector(3 downto 0); --Entrada del contador de anillo, nos indica el turno de la fila
			out_key: inout std_logic_vector(3 downto 0); --Salida hacia el teclado matricial, indica el turno de la columna
			out_word: inout std_logic_vector(7 downto 0); --Salida a los display de 7 segmentos y 4 digitos
			out_cont_write:inout std_logic_vector(5 downto 0); --contador de escritura, le dira a contRead que tecla se pulsa
			out_flag:out std_logic);--bandera  de control, cada que se pulse un boton se activa y a su vez activa a la RAM
	end component;
	
	component contring00
		port(
			clk_cr: in std_logic; --entrada de se�al de reloj
			load: in std_logic; --activacion del contador
			out_contring: out std_logic_vector(3 downto 0)); --salida hacia la fila de la matriz en turno
	end component;

	component memram00
		port(
			clk_memram:in std_logic; --entrada de reloj
			reset:in std_logic; --reset de la ram
			rw:in std_logic;	--rw de la ram
			in_flag:in std_logic; --entrada de bandera, activacion de la ram
			in_word:in std_logic_vector(7 downto 0); --entrada del codigo de display del numero, este se almacena
			in_cont_write:in std_logic_vector(5 downto 0); --entrada de contador de escritura
			in_cont_read:in std_logic_vector(5 downto 0); --entrada de contador de rectura
			out_word:inout std_logic_vector(7 downto 0)); --salida de de lectura,sale el codigo del display del numero
	
	end component;

	component contRead00 is
		port(
			clk_contRead :in std_logic; --entrada de reloj
			reset :in std_logic; --reset del contador
			rw :in std_logic; --rw del contador
			in_cont_write :in std_logic_vector(5 downto 0); --entrada de contador de escritura,servira como tope de control de escritura
			out_contRead :inout std_logic_vector(5 downto 0));--salida de contador de escritura
	
	end component;

	component muxram00
		port(
			reset: in std_logic; --reset de muxram
			rw: in std_logic; --rw de musram
			in_word_coder: in std_logic_vector(7 downto 0); --entrada que viene del coder, codigo del display
			in_word_memram: in std_logic_vector(7 downto 0); --entrada que viene de memram
			out_word: out std_logic_vector(7 downto 0)); --salida de codigo de display que se solicito por teclado matricial
	
	end component;

end packageram00;