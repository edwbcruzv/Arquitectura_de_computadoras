library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity data00 is 
port(
	clk_data: in std_logic;
	reset : in std_logic;
	in_flag_cont_config: in std_logic;
	in_flag_cont_data: in std_logic;
	in_cont: in std_logic_vector(4 downto 0);
	out_data: inout std_logic_vector(7 downto 0));

end data00;

architecture data0 of data00 is 
type arraybyte is array(0 to 63) of std_logic_vector(7 downto 0);
constant worddata: arraybyte:=(
							"00100000", --espacio
							"00100001", --¡
							"00100000", --espacio
							"01001000", --H
							"01001111", --O
							"01001100", --L
							"01000001", --A
							"00100000", --espacio
							"01001101", --M
							"01010101", --U
							"01001110", --N
							"01000100", --D
							"01001111", --O
							"00100000", --¡
							"00100001", --
							others => "00000000");
signal S_control: std_logic_vector(1 downto 0);
begin
	S_control<= (reset) &(in_flag_cont_config);
	
	process(clk_data)
	begin 
		case S_control is
			when "00" =>-- inicializacion
				out_data <= "00000000";
			when "01" => --sin sentido
				null;
			when "10" =>
				out_data <= "00000000";
			when "11" =>--se permitira la lectura mientras se alla pasado por el contfconfig primero
			
				if(clk_data'event and clk_data='1') then 
					case in_flag_cont_data is 
					when '0' =>
						null;
					when '1' =>
						out_data <= worddata(conv_integer(in_cont));
					when others => null;
					end case;
				end if;
			when others => null;
		end case;

	end process;

end data0;