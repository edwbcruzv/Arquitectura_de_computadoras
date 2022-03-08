library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity memrom00 is
	port(
		clk_rom: in std_logic; --entrada de senial de reloj
		load_rom: in std_logic; --activacion de la rom
		in_control_rom: inout std_logic_vector(4 downto 0);-- entrada de control 
		out_rom: out std_logic_vector(7 downto 0)); --salida a display
		
end memrom00;

architecture memrom0 of memrom00 is
type arrayrom is array(0 to 63) of std_logic_vector(7 downto 0);
constant wordrom: arrayrom:=("00000011", --0
							  "10011111", --1
							  "00100101", --2
							  "00001101", --3
							  "10011001", --4
							  "01001001", --5
							  "01000001", --6
							  "00011111", --7
							  "00000001", --8
							  "00011001", --9
							  "00010001", --A
							  "11000001", --B
							  "01100011", --C
							  "10000101", --D
							  "01100001", --E
							  "01110001", --F
								others => "11111111");
	
begin
		process(clk_rom)
		begin
		 if(clk_rom'event and clk_rom='1') then
			case load_rom is 
				when '0' =>
					out_rom <= "11111111";
				when '1' =>
					out_rom <= wordrom(conv_integer(in_control_rom));
				when others => null;
			end case;
		 end if;
		end process;
end memrom0;