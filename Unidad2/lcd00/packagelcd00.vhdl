library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;


package packagelcd00 is 

	component osc00
		port(div_osc :in std_logic_vector(4 downto 0);
			clk_osc:inout std_logic);
	end component;
	
	component contconfig00 
		port(clk_contconfig: in std_logic;
			reset: in std_logic;
			in_flag: in std_logic;
			out_cont: inout std_logic_vector(4 downto 0);
			out_flag: out std_logic);

	end component;

	component config00 
		port(clk_config: in std_logic;
			reset: in std_logic;
			in_flag: in std_logic;
			in_cont: in std_logic_vector(4 downto 0);
			out_data: out std_logic_vector(7 downto 0); --Datos para el LCD D0-D7
			out_EN: out std_logic;
			out_RW: out std_logic;
			out_RS: out std_logic;
			out_flag: out std_logic);

	end component;

	component contdata00
		port(clk_contdata : in std_logic;
			reset : in std_logic;
			in_flag: in std_logic;
			out_cont: inout std_logic_vector(4 downto 0);
			out_RW : out std_logic;
			out_RS : out std_logic;
			out_EN : out std_logic;
			out_flag: out std_logic);

	end component;
	
	component data00
		port(
			clk_data: in std_logic;
			reset : in std_logic;
			in_flag_cont_config: in std_logic;
			in_flag_cont_data: in std_logic;
			in_cont: in std_logic_vector(4 downto 0);
			out_data: inout std_logic_vector(7 downto 0));

	end component;
	
	component mux00
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
	
	end component;


end packagelcd00;