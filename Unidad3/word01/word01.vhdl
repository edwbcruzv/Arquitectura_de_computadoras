library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packageword01.all;

entity word01 is
	port(enable01 :in std_logic;
		clk01: out std_logic; --senal de reloj
		div01: in std_logic_vector(4 downto 0);--selector de frecuencia
		--nibles de entrada
		in_nibb_0: in std_logic_vector(3 downto 0);
		in_nibb_1: in std_logic_vector(3 downto 0);
		in_nibb_2: in std_logic_vector(3 downto 0);
		in_nibb_3: in std_logic_vector(3 downto 0);
		
		out_turno01: out std_logic_vector(3 downto 0);--
		out_word01: out std_logic_vector(7 downto 0));--salida de los segmentos del display
end word01;

architecture word0 of word01 is
signal S_clk: std_logic; --senal de reloj
signal S_cont: std_logic_vector(3 downto 0); --turno de la cifra

signal S_word_nbb0: std_logic_vector(7 downto 0);
signal S_word_nbb1: std_logic_vector(7 downto 0);
signal S_word_nbb2: std_logic_vector(7 downto 0);
signal S_word_nbb3: std_logic_vector(7 downto 0);
begin
	out_turno01 <= S_cont; 
	clk01 <= S_clk;	
	
	F00: osc00 port map(div_osc => div01,
						clk_osc => S_clk);
							
	F02: contring00 port map(clk_cont => S_clk,
						load => enable01,
						out_cont => S_cont);
						
	COD_0: coder00 port map(
							in_coder => in_nibb_0,--entrada nible0
							out_word => S_word_nbb0); --hacia mux
							
	COD_1: coder00 port map(
							in_coder => in_nibb_1,--entrada nible0
							out_word => S_word_nbb1); --hacia mux
							
	COD_2: coder00 port map(
							in_coder => in_nibb_2,--entrada nible0
							out_word => S_word_nbb2); --haciamux
							
	COD_3: coder00 port map(
							in_coder => in_nibb_3,--entrada nible0
							out_word => S_word_nbb3); --hacia mux
						
	MUX: mux00 port map(in_cont => S_cont,--turnos de cada display
						in_word_nibb_0 => S_word_nbb0,--nibble 0 
						in_word_nibb_1 => S_word_nbb1,--nibble 1
						in_word_nibb_2 => S_word_nbb2,--nibble 2
						in_word_nibb_3 => S_word_nbb3,--nibble 3
						out_word => out_word01);--salida hacia el Display 4 segnmentos
						
end word0;