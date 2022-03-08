library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
	port(clk_cod:in std_logic; 
		in_key_cod: in std_logic_vector(3 downto 0); --turnos de cada fila del teclado
		out_key_cod: inout std_logic_vector(3 downto 0); --turnos de cada columna del teclado
		out_coder: inout std_logic_vector(7 downto 0)); --salida a los display de 7 segmentos y 4 digitos
end coder00;

architecture coder0 of coder00 is
signal S_vector: std_logic_vector(7 downto 0);
begin
--				in_key
--				(3)(2)(1)(0)
--			(0)	 7  8  9  /
--  out_key	(1)	 4  5  6  *
--			(2)	 1  2  3  - 
--			(3)	 0  c  =  +

	P00:process(clk_cod,in_key_cod,out_key_cod)
	variable auxl:bit:='0';
	begin
	
		if(clk_cod'event and clk_cod='1') then
			case out_key_cod is
				when "0001" => 
					
						case in_key_cod is 
							when "1000" =>
								if auxl='0' then
									auxl:='1';
									out_coder <= "00011111";-- 7
								end if;
							when "0100" =>
								if auxl='0' then
									auxl:='1';
									out_coder <= "00000001";-- 8
								end if;
							when "0010" =>
								if auxl='0' then
									auxl:='1';
									out_coder <= "00011001";-- 9
								end if;
							when "0001" =>
								if auxl='0' then
									auxl:='1';
									out_coder <= "00010001";-- A
								end if;
							when others =>
								auxl:='0';
								out_coder <= "11111111";
								
						end case;
						
					
				when "0010" =>
					if auxl='0' then
						case in_key_cod is 
							when "1000" =>
							if auxl='0' then
								auxl:='1';
								out_coder <= "10011001";-- 4
								end if;
							when "0100" =>
							if auxl='0' then
								auxl:='1';
								out_coder <= "01001001";-- 5
								end if;
							when "0010" =>
							if auxl='0' then
								auxl:='1';
								out_coder <= "01000001";-- 6
								end if;
							when "0001" =>
							if auxl='0' then
								auxl:='1';
								out_coder <= "11000000";-- B
								end if;
							when others =>
								auxl:='0';
								out_coder <= "11111111";
						end case;
					end if;
				when "0100" => 
					if auxl='0' then
						case in_key_cod is 
							when "1000" =>
								if auxl='0' then
									auxl:='1';
									out_coder <= "10011111";-- 1
								end if;
							when "0100" =>
								if auxl='0' then
									auxl:='1';
									out_coder <= "00100101";-- 2
									end if;
							when "0010" =>
								if auxl='0' then
									auxl:='1';
									out_coder <= "00001101";-- 3
								end if;
							when "0001" =>
								if auxl='0' then
									auxl:='1';
									out_coder <= "01100011";-- C
								end if;
							when others =>
								auxl:='0';
								out_coder <= "11111111";
						end case;
					end if;
				when "1000" =>
					if auxl='0' then
						case in_key_cod is 
							when "1000" =>
								if auxl='0' then
									auxl:='1';
									out_coder <= "00000011";-- 0
								end if;
							when "0100" =>
								if auxl='0' then
									auxl:='1';
									out_coder <= "00111000";-- +
								end if;
							when "0010" =>
								if auxl='0' then
									auxl:='1';
									out_coder <= "11000100";-- -
								end if;
							when "0001" =>
								if auxl='0' then
									auxl:='1';
									out_coder <= "10000100";-- D
								end if;
							when others =>
								auxl:='0';
								out_coder <= "11111111";
						end case;
					end if;
				when others => 
						--out_coder <= "11111110"; --se precinan botones al mimo tiempo
			end case;
		end if;
	end process;
end coder0;