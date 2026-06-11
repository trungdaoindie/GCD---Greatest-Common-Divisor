library ieee;
use ieee.std_logic_1164.all;

entity regn is
    generic (
        N : integer := 8
    );
    port (
        D     : in  std_logic_vector(N-1 downto 0);
        Reset, Clk, En : in  std_logic;
        Q     : out std_logic_vector(N-1 downto 0)
    );
end regn;

architecture Behavior of regn is
begin

    process(Clk, Reset)
    begin
        if Reset = '1' then
            Q <= (others => '0'); 

        elsif (Clk'event and Clk = '1') then
            if En = '1' then
                Q <= D;
            end if;
        end if;
    end process;
end Behavior;

