library ieee;
use ieee.std_logic_1164.all;

PACKAGE Mylib IS
 COMPONENT Regn IS
    generic ( N : integer := 8);
    port (
        D     : in  std_logic_vector(N-1 downto 0);
        Reset, Clk, En : in  std_logic;
        Q     : out std_logic_vector(N-1 downto 0)
    );
 END COMPONENT;

 COMPONENT Datapath IS
 GENERIC (DATA_WIDTH : integer := 8);
	port(
	X_sel, Y_sel : IN std_logic;
	X_ld, Y_ld : IN std_logic;
	X_i, Y_i : IN std_logic_vector(DATA_WIDTH - 1 downto 0);
	
	rst,clk : IN std_logic;
	GCD_ld : IN std_logic;

	X_neq_Y : OUT std_logic;
	X_lt_Y : OUT std_logic;
	GCD_o : OUT std_logic_vector(DATA_WIDTH - 1 downto 0));
 END COMPONENT;

 COMPONENT Controller IS
 port(
	rst,clk : IN std_logic;
	start_i : IN std_logic;

	X_sel, Y_sel : OUT std_logic;
	X_ld, Y_ld : OUT std_logic;
	GCD_ld : OUT std_logic;
	X_neq_Y, X_lt_Y : IN Std_logic;
	Done_o : OUT std_logic);
end COMPONENT;

 COMPONENT gcd IS
 GENERIC (DATA_WIDTH : integer := 8);
	port(
	X_i, Y_i : IN std_logic_vector(DATA_WIDTH - 1 downto 0);
	rst,clk,start_i : IN std_logic;
	GCD_o : OUT std_logic_vector(DATA_WIDTH - 1 downto 0);
	DONE_o : OUT std_logic);
end COMPONENT;
END Mylib;

