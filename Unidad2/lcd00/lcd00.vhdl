library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagelcd00.all;

entity lcd00 is
	port(
		div_00: in std_logic_vector(4 downto 0);
		clk_00: out std_logic;
		reset: in std_logic;

		cont_config: out std_logic_vector(4 downto 0);--sale de c
		flag_cont_config: out std_logic; --sale del contconfig00 
		flag_config: out std_logic; --sale del config00 va hacia 
		flag_cont_data: out std_logic; --sale de contdata hacia d
		contdata: out std_logic_vector(4 downto 0);--sale de cont
		--conecta el config con el mux
		RW_Config : out std_logic;
		RS_Config : out std_logic;
		EN_Config : out std_logic;
		--conecta con data con mux,
		RS_Data : out std_logic;
		RW_Data : out std_logic;
		EN_Data : out std_logic;

		Data_aux: out std_logic_vector(7 downto 0);--sale del config

		out_RS_lcd: out std_logic;--hacia LCD
		out_RW_lcd: out std_logic;--hacia LCD
		out_EN_lcd: out std_logic;--hacia LCD
		out_data_lcd: out std_logic_vector(7 downto 0) --hacia LCD
		);
end lcd00; 

architecture lcd0 of lcd00 is
signal S_clk: std_logic;

signal S_cont_config: std_logic_vector(4 downto 0);--sale de contconfig hacia config
signal S_flag_cont_config: std_logic; --sale del contconfig00  hacia config

signal S_flag_config: std_logic; --sale del config00 va hacia contconfig, contdata, data y mux

signal S_flag_cont_data: std_logic; --sale de contdata hacia data
signal S_contdata: std_logic_vector(4 downto 0);--sale de contdata00

--conecta el config con el mux
signal S_RW_Config : std_logic;
signal S_RS_Config : std_logic;
signal S_EN_Config : std_logic;

 --conecta con data con mux,
signal S_RS_Data : std_logic;
signal S_RW_Data : std_logic;
signal S_EN_Data : std_logic;
	
signal S_Data_Config:std_logic_vector(7 downto 0);--sale de config hacia mux
signal S_Data_Data:std_logic_vector(7 downto 0);--sale de data hacia mux
signal S_Data_aux:std_logic_vector(7 downto 0);--sale de data hacia mux

begin
	clk_00 <= S_clk;

	cont_config <= S_cont_config;
	flag_cont_config <= S_flag_cont_config;

	flag_config <= S_flag_config;

	flag_cont_data <= S_flag_cont_data;
	contdata <= S_contdata;
	
	RW_Config <= S_RW_Config;
	RS_Config <= S_RS_Config;
	EN_Config <= S_EN_Config;
	
	RS_Data <= S_RS_Data;
	RW_Data <= S_RW_Data;
	EN_Data <= S_EN_Data;

	Data_aux <= S_Data_aux;
	out_data_lcd <= S_Data_aux;
	
	F01: osc00 port map(div_osc => div_00,clk_osc => S_clk); 
	
	F02: contconfig00 port map(clk_contconfig => S_clk, --seniales de reloj
								reset => reset,--
								in_flag => S_flag_config, --viene de config
								out_cont => S_cont_config, --salida del contador de configuracion hacia el config
								out_flag => S_flag_cont_config); -- va hacia config
								
	F03: config00 port map(clk_config => S_clk, --seniales de reloj
							reset => reset,--
							in_flag => S_flag_cont_config, -- viene de contconfig
							in_cont => S_cont_config, --viene de contconfig
							out_data => S_Data_Config,--va hacia mux
							out_EN => S_EN_Config, --va hacia mux
							out_RW => S_RW_Config, --va hacia mux
							out_RS => S_RS_Config, --va hacia mux
							out_flag =>S_flag_config); --va hacia contconfig, contdata, data y mux
							
	F04: contdata00 port map(clk_contdata => S_clk, --seniales de reloj
							reset => reset, --
							in_flag => S_flag_config, --viene de config
							out_cont => S_contdata, --va hacia data
							out_RW => S_RW_Data, --va hacia mux 
							out_RS => S_RS_Data, --va hacia mux 
							out_EN => S_EN_Data, --va hacia mux 
							out_flag => S_flag_cont_data); --va hacia data
							
	F05: data00 port map(clk_data => S_clk, --seniales de reloj
						reset => reset, --
						in_flag_cont_config => S_flag_config, --viene de config duda
						in_flag_cont_data => S_flag_cont_data, --viene de contdata
						in_cont => S_contdata, --viene de contdata
						out_data => S_Data_Data); --va hacia mux
						
	F06: mux00 port map(
						reset => reset,--
						in_flag_config => S_flag_config, --viene de config
						in_command => S_Data_Config,--viene de config
						in_RW_config => S_RW_Config, --viene de config
						in_RS_config => S_RS_Config, --viene de config
						in_EN_config => S_EN_Config, --viene de config
						in_data => S_Data_Data, --viene de data
						in_RW_data => S_RW_Data, --viene de contdata
						in_RS_data => S_RS_Data, --viene de contdata
						in_EN_data => S_EN_Data, --viene de contdata
						out_databyte => S_Data_aux, --salida hacia el lcd
						out_RW => out_RW_lcd,
						out_RS => out_RS_lcd,
						out_EN => out_EN_lcd);


end lcd0;