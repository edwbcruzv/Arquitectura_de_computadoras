library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity cont00 is
port(
	clkc: in std_logic;
	resetc:in std_logic;
	outcontc: inout std_logic_vector(4 downto 0);
	outflagc: out std_logic);

end cont00;

architecture cont0 of cont00 is
begin
	pcont: process(clkc)
	begin	
		case resetc is
			when '0' =>
				outcontc <=(others => '0');
				outflagc <= '0';
			when '1' =>
				if (clkc'event and clkc='1') then
					if(outcontc < "01111")then
						outcontc <= outcontc +'1';
					else
						outflagc <= '1';
					end if;
				end if;
			when others =>null;
		end case;
	end process pcont;
end cont0;