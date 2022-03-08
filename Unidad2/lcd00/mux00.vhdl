library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity mux00 is 
port(
	reset: in std_logic;
	in_flag_config: in std_logic; --modulo de configuracion
	in_command: in std_logic_vector(7 downto 0);
	in_RW_config : in std_logic;
	in_RS_config : in std_logic;
	in_EN_config : in std_logic;
	in_data: in std_logic_vector(7 downto 0);
	in_RW_data : in std_logic;
	in_RS_data : in std_logic;
	in_EN_data : in std_logic;
	out_databyte: out std_logic_vector(7 downto 0);
	out_RW : out std_logic;
	out_RS : out std_logic;
	out_EN : out std_logic);
	
end mux00;

architecture mux0 of mux00 is
signal S_control: std_logic_vector(1 downto 0);
begin
	S_control <= (reset) &(in_flag_config);
	-------------------------------------------
	with S_control select
		out_databyte <= in_command when "10",
						in_data when "11",
						"00000000" when others;
	-------------------------------------------
	with S_control select
		out_RW <= in_RW_config when "10",
						in_RW_data when "11",
						'0' when others;
	-------------------------------------------
	with S_control select
		out_RS <= in_RS_config when "10",
						in_RS_data when "11",
						'0' when others;
	-------------------------------------------
	with S_control select
		out_EN <= in_EN_config when "10",
						in_EN_data when "11",
						'0' when others;
end mux0;