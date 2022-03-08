library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity contRead00 is 
	port(clk_cont: in std_logic; --señal de reloj
		load_cont: in std_logic; --activacion del contador
		out_control: inout std_logic_vector(4 downto 0)); --salida del contador
	
end contRead00;

architecture contRead0 of contRead00 is 
begin
	process(clk_cont)
	begin
		if(clk_cont'event and clk_cont='1') then
			case load_cont is
				when '0' => 
					out_control <= (others => '0');
				when '1' =>
					if(out_control < "10000") then --mientras que el contador sea menor a 16 en binario
						out_control <= out_control + '1';
					else
						out_control <= out_control;
					end if;
				when others => null;
			end case;
		end if;
	end process;
end contRead0;