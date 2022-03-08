library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packageregistercomplete00.all;

entity topregistercomplete00 is
	port( Load_0: in std_logic;
		CLK_0: inout std_logic;
		selector_0: in std_logic_vector(2 downto 0);
		div_0: in std_logic_vector(4 downto 0);
		position_0: in std_logic_vector(3 downto 0);
		Qin_0: in std_logic_vector(7 downto 0);
		Qout_0: out std_logic_vector(7 downto 0));
end topregistercomplete00;

architecture topregistercomplete0 of topregistercomplete00 is
signal S_CLK: std_logic;
begin
	CLK_0 <= S_CLK;
	
	CLK00: osc00 port map(div_osc => div_0,
							clk_osc => S_CLK);
	
	REG00: registercomplete00 port map( Load =>Load_0,
										CLKin => S_CLK,
										selector=>selector_0,
										position => position_0,
										Qin => Qin_0,
										Qout => Qout_0);

end topregistercomplete0;
