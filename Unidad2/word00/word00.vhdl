library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packageword00.all;

entity word00 is
	port(loadw :in std_logic;
		clkw: out std_logic; --senal de reloj
		divw: in std_logic_vector(4 downto 0);--selector de frecuencia
		out_cont00: out std_logic_vector(3 downto 0);--
		out_coder00: out std_logic_vector(7 downto 0));--salida de los segmentos del display
end word00;


architecture word0 of word00 is
signal S_clk: std_logic; --senal de reloj
signal S_cont: std_logic_vector(3 downto 0); --turno de la cifra
begin
	out_cont00 <= S_cont; 
	clkw <= S_clk;	
	
	F00: osc00 port map(div_osc => divw ,clk_osc => S_clk);
							
	F02: contring00 port map(clk_cont => S_clk, load => loadw ,out_cont => S_cont);
			
	F01: coder00 port map(in_cod => S_cont, out_cod => out_coder00);

end word0;