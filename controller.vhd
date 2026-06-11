library ieee;
use ieee.std_logic_1164.all;

entity Controller is
	port(
	rst,clk : IN std_logic;
	start_i : IN std_logic;

	X_sel, Y_sel : OUT std_logic;
	X_ld, Y_ld : OUT std_logic;
	GCD_ld : OUT std_logic;
	X_neq_Y, X_lt_Y : IN Std_logic;
	Done_o : OUT std_logic);
end Controller;



architecture behavioral of Controller is
 TYPE State_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12);
 SIGNAL state : State_type;
begin
 -- State transition process
 FSM: Process(rst, clk)
 begin
  	IF(rst = '1') then
		State <= S0;
	ELSIF(clk'event and clk = '1') then
	 	CASE State is 
			WHEN S0 => State <= S1;
			WHEN S1 => IF (start_i = '1') then State <= S2;
				 ELSE State <= S1;
				END IF;
			WHEN S2 => State <= S3;
			WHEN S3 => State <= S4;
			WHEN S4 => IF (X_neq_Y = '1') then State <= S5;
				   ELSE State <= S9;
				   END IF;
			WHEN S5 => IF (X_lt_y = '1') then State <= S6;
				   ELSE State <= S7;
				   END IF;
			WHEN S6 => State <= S8;
			WHEN S7 => State <= S8;
			WHEN S8 => State <= S4;
			WHEN S9 => State <= S10;
			WHEN S10 => State <= S11;
			WHEN S11 => IF (start_i = '0') then State <= S12;
				    END IF;
			WHEN S12 => State <= S0;
			WHEN OTHERS => State <= S0;
		END CASE;
	END IF;
end process;

 -- Combination Logic
 X_sel <= '1' WHEN State = S2 ELSE '0';
 X_ld <= '1' WHEN (State = S2 or State = S7 ) ELSE '0';
 Y_sel <= '1' WHEN State = S3 ELSE '0';
 Y_ld <= '1' WHEN (State = S3 or State = S6 ) ELSE '0';
 GCD_ld <= '1' WHEN State = S9 ELSE '0';
 Done_o <= '1' WHEN State = S10 ELSE '0';
end behavioral;
