library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageshiftrLR00.all;

entity topshiftrLR00 is
	port(clk0 :inout std_logic; --Salida de se�al de reloj
		cdiv0: in std_logic_vector(4 downto 0); --Entrada del divisor de frecuencia
		en0: in std_logic; --Se�al de carga del vector (LOAD)
		in0:in  std_logic_vector(7 downto 0);--Vector de entrada a desplazar 
		out0:out std_logic_vector(7 downto 0)); --Vista general del registro
		
end topshiftrLR00;

architecture topshiftrLR0 of topshiftrLR00 is

begin
	SH00: osc00 port map(clk_osc => clk0,div_osc => cdiv0);
	
	SH01: shiftrLR00 port map(clks => clk0,
								ens => en0,
								ins => in0,
								outs => out0);

end topshiftrLR0;