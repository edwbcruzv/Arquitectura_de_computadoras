library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contring00 is
	port(
		clk_cont: in std_logic;
		load: in std_logic;
		out_cont: out std_logic_vector(3 downto 0));
end contring00;

architecture contring0 of contring00 is
signal S_vector: std_logic_vector(3 downto 0);
begin
	process(clk_cont)
	begin
		if(clk_cont'event and clk_cont='1') then
		out_cont <= "1111";
		S_vector <= "0111";
			case load is
				when '0' =>
					out_cont <= "1111";
					S_vector <= "0111";
				when '1' =>
					S_vector(3) <= S_vector(0);
					S_vector(2 downto 0) <= S_vector(3 downto 1);
					out_cont <= S_vector;
				when others => null;
				
			end case;
		end if;
	end process;
end contring0;