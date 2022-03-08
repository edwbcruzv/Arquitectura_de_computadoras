library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagebarrelLR00.all;

entity topbarrelLR00 is
	port(div_0 :in std_logic_vector(4 downto 0);
		clk_0: out std_logic;  --Entrada de señal de reloj
		en_0: in std_logic;		--Señal de carga del vector (LOAD)
		control_0: in std_logic_vector(2 downto 0);-- control de desplazamiento, indicaremos el numero de posiciones a desplazar
		in_0: in std_logic_vector(7 downto 0); --Vector de entrada a desplazar 
		out_0: out std_logic_vector(7 downto 0)); --Vista general del registro
	
end topbarrelLR00;


architecture topbarrelLR0 of topbarrelLR00 is
signal S_CLK: std_logic;
begin
	clk_0 <= S_CLK;
	
	CLK00: osc00 port map(div_osc => div_0,clk_osc => S_CLK);
	
	BAR00: barrelLR00 port map(clkb => S_CLK,
			enb => en_0,
			controlb => control_0,
			inb => in_0,
			outb => out_0);

end topbarrelLR0;

