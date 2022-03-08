library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity contdata00 is 
port(clk_contdata : in std_logic;
	reset : in std_logic;
	in_flag: in std_logic;
	out_cont: inout std_logic_vector(4 downto 0);
	out_RW : out std_logic;
	out_RS : out std_logic;
	out_EN : out std_logic;
	out_flag: out std_logic);

end contdata00;

architecture contdata0 of contdata00 is
signal S_control: std_logic_vector(1 downto 0);
begin
	S_control <= (reset)&(in_flag);
	
	process(clk_contdata)
	variable aux: bit:= '0';
	begin
		case S_control is
		when "00" => --inicializacion
			out_cont<="00000";
			out_RW <= '0';
			out_RS <= '0';
			out_EN <= '0';
			out_flag <= '0';
		when "01" => --sin sentido 
			null;
		when "10" =>
			out_cont<="00000";
			out_RW <= '0';
			out_RS <= '0';
			out_EN <= '0';
			out_flag <= '0';
		when "11" =>--ya se termino de ejecutar el contconfig
	
			if(clk_contdata'event and clk_contdata='1') then
				case aux is 
					when '0' =>
						aux:= '1';
						out_cont <= out_cont;
						out_RW <= '0';
						out_RS <= '1';
						out_EN <= '1';
						out_flag <= '1';
					when '1' => -- se lee el data
						aux:= '0';
						
						if (out_cont < "10000") then --menor que 15 
							out_cont <= out_cont +'1';
							out_RW <= '0';
							out_RS <= '1';
							out_EN <= '0';
							out_flag <= '0';
						end if;
						
					when others => null;
				end case;
			
			end if;
		
		when others => null;
		end case;
	
	end process;

end contdata0;