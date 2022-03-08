library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity ac_alu_00 is
	port(
		clk_ac: in std_logic;
		en: in std_logic;
		in_ac:in std_logic_vector(7 downto 0);
		in_flag: in std_logic;
		out_ac: out std_logic_vector(7 downto 0);
		out_flag: out std_logic);
end ac_alu_00;

architecture ac_alu_0 of ac_alu_00 is
signal S_control: std_logic_vector(1 downto 0);
begin
	S_control <= (en)&(in_flag);
	process(clk_ac)
	variable aux:bit :='0';
	begin
		if (clk_ac'event and clk_ac='1')then
			aux:= '0';
			case S_control is --bandera de entrada
				when "00" => 
					out_ac <= (others => '0');
					out_flag <= '0';
				when "10" => 
					if(aux='0')then
						aux:= '1';
						out_ac <= in_ac;
						out_flag <= '1';
					end if;
				when "11" => 
					if(aux='1')then
						aux:= '0';
						out_ac <= in_ac;
						out_flag <= '1';
					end if;
				when others => null;
			end case;--fin de la bandera de entrada
		end if;
	end process;

end ac_alu_0;