
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE work.mylib.all;

ENTITY GCD_tb IS
END GCD_tb;

ARCHITECTURE BEV OF GCD_tb IS
 Constant DATA_WIDTH : integer := 8;
 SIGNAL Reset, CLK :  STD_LOGIC := '0';
 SIGNAL	Start_i:  STD_LOGIC;
 SIGNAL	X_i, Y_i:  STD_LOGIC_VECTOR(DATA_WIDTH -  1 downto 0);
 SIGNAL	GCD_o: 	 STD_LOGIC_VECTOR(DATA_WIDTH -  1 downto 0);
 SIGNAL	Done_o :  STD_LOGIC;
BEGIN

 UUT: GCD
  GENERIC MAP (DATA_WIDTH)
  PORT MAP (
	X_i, Y_i,
	reset,clk,start_i,
	GCD_o,
	DONE_o
	);
 CLK <= not CLK  after 10 ns;
-- stimulus
Stimulus: PROCESS
 BEGIN
  START_i <= '0';
  Reset <= '1'; wait for 20 ns;
  Reset <= '0'; wait for 20 ns;
-- Case 1: X_i = 12, Y_i = 4
  X_i <= X"0C";
  Y_i <= X"04";
  Start_i <= '1';
  wait until Done_o = '1';
  Start_i <= '0';
  wait for 100 ns;
-- Case 2: X_i = 3, Y_i = 9
  X_i <= X"03";
  Y_i <= X"09";
  Start_i <= '1';
  wait until Done_o = '1';
  Start_i <= '0';
  wait for 100 ns; 
-- Case 3: X_i = 5, Y_i = 7
  X_i <= X"05";
  Y_i <= X"07";
  Start_i <= '1';
  wait until Done_o = '1';
  Start_i <= '0';
  wait for 100 ns; 
  wait;
END PROCESS;
END BEV;