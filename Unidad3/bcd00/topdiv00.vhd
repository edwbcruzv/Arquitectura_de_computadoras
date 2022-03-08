library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagediv00.all;

entity topdiv00 is
  port(
       indiv0: in std_logic_vector(4 downto 0);
       oscout0: inout std_logic;
       indiv01: in std_logic_vector(4 downto 0);
       oscout01: inout std_logic);
end topdiv00;

architecture topdiv0 of topdiv00 is
signal sclk: std_logic;
begin

  UD00: osc00 port map(osc_int => sclk);
  
  UD01: div00 port map(clkdiv => sclk,
                       indiv => indiv0,
                       outdiv => oscout0);

  UD02: div01 port map(clkdiv1 => sclk,
                       indiv1 => indiv01,
                       outdiv1 => oscout01);


end topdiv0;