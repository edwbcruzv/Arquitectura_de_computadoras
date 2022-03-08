library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageosc00.all;

entity osc00 is 
	port(div_osc :in std_logic_vector(4 downto 0);
		clk_osc:inout std_logic);
end osc00;

architecture osc0 of osc00 is
signal S_puente:std_logic;
begin

	F00: oscint00 port map(osc_int => S_puente);
	
	F01: div00 port map(clkdiv => S_puente,
						indiv => div_osc,
						oscout => clk_osc);
						
end osc0;