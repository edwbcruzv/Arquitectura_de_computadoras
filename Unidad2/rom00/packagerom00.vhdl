library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

package packagerom00 is

	component osc00
	port(div_osc :in std_logic_vector(4 downto 0);
		clk_osc:inout std_logic);
	end component;

	component contRead00 
	port(clk_cont: in std_logic;
		load_cont: in std_logic;
		out_control: inout std_logic_vector(4 downto 0));
	end component;

	component memrom00 
	port(
		clk_rom: in std_logic; --entrada de senial de reloj
		load_rom: in std_logic; --activacion de la rom
		in_control_rom: inout std_logic_vector(4 downto 0);-- entrada de control
		out_rom: out std_logic_vector(7 downto 0)); --salida a display
	end component;


end packagerom00;