library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagekey00.all;

entity key00 is
	 port(clk_key:out std_logic; --salida de reloj
		load_key:in std_logic; 
		div_key:in std_logic_vector(4 downto 0); --frencuencia del oscilador
		in_key: in std_logic_vector(3 downto 0); --fila del teclado
		out_key: inout std_logic_vector(3 downto 0); --columna del teclado
		dig_display:out std_logic_vector(3 downto 0); --digitos display
		out_coder: out std_logic_vector(7 downto 0)); --salida a los display de 7 segmentos y 4 digitos
		
end key00;

architecture key0 of key00 is
signal S_clk: std_logic;
signal S_in_key: std_logic_vector(3 downto 0);
signal S_out_key: std_logic_vector(3 downto 0);
signal S_out_coder: std_logic_vector(7 downto 0);
begin
	clk_key <= S_clk;
	out_key <= S_out_key;
	out_coder <= S_out_coder;
	dig_display <= "0111";
	CLK00: osc00 port map(div_osc => div_key, clk_osc =>S_clk);
	
	COUNT: contring00 port map(clk_cont => S_clk,
			load => load_key,
			out_cont => S_out_key);
			
	CODER: coder00 port map(clk_cod => S_clk,
			in_key_cod => in_key,
			out_key_cod => S_out_key,
			out_coder =>S_out_coder);
			
end key0;