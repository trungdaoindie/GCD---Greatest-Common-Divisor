library ieee;
use ieee.std_logic_1164.all;
use work.Mylib.all;

entity gcd is
	GENERIC (DATA_WIDTH : integer := 8);
	port(
	X_i, Y_i : IN std_logic_vector(DATA_WIDTH - 1 downto 0);
	rst,clk,start_i : IN std_logic;
	GCD_o : OUT std_logic_vector(DATA_WIDTH - 1 downto 0);
	DONE_o : OUT std_logic);
end gcd;

architecture RTL of gcd is
 SIGNAL X_sel, Y_sel : STD_logic;
 SIGNAL X_ld, Y_ld : STD_logic;
 SIGNAL GCD_ld : STD_LOGIC;
 SIGNAL X_neq_Y, X_lt_Y : STD_logic;
begin
 CTRL_UNIT: Controller
 port map (
	rst,clk,
	start_i,

	X_sel, Y_sel,
	X_ld, Y_ld,
	GCD_ld,
	X_neq_Y, X_lt_Y,
	Done_o);

 Datapath_unit : Datapath
 generic map (DATA_WIDTH)
 port map (
 	X_sel, Y_sel,
	X_ld, Y_ld,
	X_i, Y_i,
	
	rst,clk,
	GCD_ld,

	X_neq_Y,
	X_lt_Y,
	GCD_o);
end RTL;
