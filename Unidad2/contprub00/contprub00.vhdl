library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packagecont00.all;


entity contprub00 is
port(
	clk0: inout std_logic;
	cdiv0: in std_logic_vector(4 downto 0);
	reset0: in std_logic;
	outcontc0: inout std_logic_vector(4 downto 0);
	outflag0: out std_logic
	);

end contprub00;

architecture contprub0 of contprub00 is
begin
	F00: osc00 port map(div_osc => cdiv0,
			clk_osc => clk0);
	
	F01: cont00 port map(
		clkc => clk0,
		resetc => reset0,
		outcontc => outcontc0,
		outflagc => outflag0);
		
end contprub0;