library ieee;
use ieee.std_logic_1164.all;
use work.Mylib.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Datapath is
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
end Datapath;

architecture RTL of Datapath is
 SIGNAL X_src, X_sub_Y, Y_src, Y_sub_X, X, Y  : std_logic_vector(DATA_WIDTH - 1 downto 0);
begin
 --Multiplexer for X
 X_src <= X_i WHEN X_sel = '1' ELSE X_sub_Y;
 --Multiplexer for Y
 Y_src <= Y_i WHEN Y_sel = '1' ELSE Y_sub_X;


 --Compare X not equal Y or not?
 X_neq_Y <= '1' WHEN (X /= Y) ELSE '0';

 --Compare X < Y or not?
 X_lt_Y <= '1' WHEN (X < Y) ELSE '0';

 --Subtract X to Y
 X_sub_Y <= X - Y;

 --Subtract Y to X
 Y_sub_X <= Y - X;


 --Register X
 REGX: REGn
 generic map(DATA_WIDTH)
 port map (
        D => X_src,
        Reset => rst, Clk => clk, En => X_ld, 
        Q => X
  );

 --Register Y
 REGy: REGn
 generic map(DATA_WIDTH)
 port map (
        D => Y_src,
        Reset => rst, Clk => clk, En => Y_ld, 
        Q => Y
  );

--Register GCD
 REG_gcd: REGn
 generic map(DATA_WIDTH)
 port map (
        D => X,
        Reset => rst, Clk => clk, En => GCD_ld, 
        Q => GCD_o
  );



end RTL;
