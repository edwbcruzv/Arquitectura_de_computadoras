library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity contconfig00 is
port(clk_contconfig: in std_logic;
	reset: in std_logic;
	in_flag: in std_logic;
	out_cont: inout std_logic_vector(4 downto 0);
	out_flag: out std_logic);

end contconfig00;

architecture contconfig0 of contconfig00 is 
signal S_control : std_logic_vector(1 downto 0);
begin
	S_control <= (reset)&(in_flag);
	process(clk_contconfig)
	begin
		if(clk_contconfig'event and clk_contconfig='1') then
			case S_control is
				when "00" => --no se hace nada
					out_cont <= (others => '0');
					out_flag <= '0';
				when "10" => --se habilita el envio de comandos
					out_cont <= out_cont + '1';
					out_flag <= '1';
				when "11" => --se envia el ultimo comando pero se apaga la bandera de salida
					out_cont <= out_cont;
					out_flag <= '0';
				when others => null;
			end case;
		end if;
	end process;

end contconfig0;