library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity and_alu_00 is
	port(
		clk_and: in std_logic;
		funct: in std_logic_vector(5 downto 0);
		in_data_A: in std_logic_vector(7 downto 0);
		in_data_B: in std_logic_vector(7 downto 0);
		in_flag: in std_logic;
		out_data_C: out std_logic_vector(7 downto 0);
		out_flag: out std_logic);
 end and_alu_00;
 
 architecture and_alu_0 of and_alu_00 is
 begin
	
	process(clk_and)
	variable aux: bit:='0';
	begin
		if(clk_and'event and clk_and='1') then
			if (funct = "000001") then 
				case in_flag is--bandera de entrada
					when '0' =>
						out_flag <= '0';
					when '1' =>
						if (aux = '0')then--variable auxiliar
							aux:='1';
							out_data_C <= in_data_A and in_data_B;
							out_flag <= '1';
						else
							out_flag <= '0';
						end if;	 --fin de if de variable auxiliar
					when others => null;
				end case;--fin de case bandera de entrada
			else
				aux := '0';
				out_data_C <= (others => 'Z');
				out_flag <= 'Z';
			end if;
		end if;
	
	end process;

 end and_alu_0;