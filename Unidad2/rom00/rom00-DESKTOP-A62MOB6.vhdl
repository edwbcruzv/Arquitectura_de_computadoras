library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packagerom00.all;

entity rom00 is 
	port(
		div_rom00: in std_logic_vector(4 downto 0);
		clk_rom00: out std_logic;
		load_rom00: in std_logic;
		control_ram00:inout std_logic_vector(4 downto 0);
		display_rom00: out std_logic_vector(7 downto 0);
		out_digito_dp: out std_logic_vector(3 downto 0));
end rom00;

architecture rom0 of rom00 is
signal S_clk : std_logic;
begin

	clk_rom00 <= S_clk;
	out_digito_dp <="0111";
	
	clk00: osc00 port map(div_osc => div_rom00,
		clk_osc => S_clk );
	
	ctrRead: contRead00 port map(clk_cont => S_clk,
		load_cont => load_rom00,
		out_control => control_ram00);
	
	mrom: memrom00 port map(
		clk_rom => S_clk,
		load_rom => load_rom00,
		in_control_rom => control_ram00,
		out_rom => display_rom00);

end rom0;