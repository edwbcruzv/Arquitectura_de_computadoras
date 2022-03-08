library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity coderNibbles00 is
port( 
	AC12bit03: in std_logic_vector ( 11 downto 0 );
	outU: out std_logic_vector ( 6 downto 0 );
	outD: out std_logic_vector ( 6 downto 0 );
	outC: out std_logic_vector ( 6 downto 0 ) );
end coderNibbles00;

architecture coderNibbles0 of coderNibbles00 is
signal nibbU, nibbD, nibbC: std_logic_vector(3 downto 0);
begin
nibbU <= AC12bit03(3 downto 0);
nibbD <= AC12bit03(7 downto 4);
nibbC <= AC12bit03(11 downto 8);

  with nibbU select
             outU <= "1111110"  when "0000",
			         "0110000"  when "0001",
                     "1101101"  when "0010",
                     "1111001"  when "0011",
                     "0110011"  when "0100",
                     "1011011"  when "0101",
                     "1011111"  when "0110",
                     "1110000"  when "0111",
                     "1111111"  when "1000",
                     "1110011"  when "1001",
                     "0000001" when others;
------------------------------------------------
  with nibbD select
             outD <= "1111110"  when "0000",
			         "0110000"  when "0001",
                     "1101101"  when "0010",
                     "1111001"  when "0011",
                     "0110011"  when "0100",
                     "1011011"  when "0101",
                     "1011111"  when "0110",
                     "1110000"  when "0111",
                     "1111111"  when "1000",
                     "1110011"  when "1001",
                     "0000001" when others;
------------------------------------------------
  with nibbC select
             outC <= "1111110"  when "0000",
			         "0110000"  when "0001",
                     "1101101"  when "0010",
                     "1111001"  when "0011",
                     "0110011"  when "0100",
                     "1011011"  when "0101",
                     "1011111"  when "0110",
                     "1110000"  when "0111",
                     "1111111"  when "1000",
                     "1110011"  when "1001",
                     "0000001" when others;------------------------------------------------
end coderNibbles0;