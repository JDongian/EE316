library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;


entity SM is
    port(rst, clk, X: in std_logic;
         Q1, Q2, Q3, Z: out std_logic);
end SM;

architecture SM_a of SM is
    signal state, nextstate: integer range 0 to 12 := 0;
begin
    process (state, X)
    begin
        case state is
            -- default to no action
            Load <= '0';
            Shift <= '0';
            Add1 <= '0';
            Add2 <= '0';
            Done <= '0';

            when 0 =>
                if (St = '0') then
                    nextstate <= 0;
                else
                    Load <= '1';
                    nextstate <= 1;
                end if;
            when 1 =>
                if (M = '1') then
                    Add1 <= '1';
                    nextstate <= 2;
                else
                    Shift <= '1';
                    nextstate <= 3;
                end if;
             when 2 =>
                Shift = '1';
                nextstate <= 3;
            when 3 =>
                if (M = '1') then
                    Add1 <= '1';
                    nextstate <= 4;
                else
                    Shift <= '1';
                    nextstate <= 5;
                end if;
             when 4 =>
                Shift = '1';
                nextstate <= 5;
            when 5 =>
                if (M = '1') then
                    Add1 <= '1';
                    nextstate <= 6;
                else
                    Shift <= '1';
                    nextstate <= 7;
                end if;
             when 6 =>
                Shift = '1';
                nextstate <= 7;
            when 7 =>
                if (M = '1') then
                    Add1 <= '1';
                    nextstate <= 8;
                else
                    Shift <= '1';
                    nextstate <= 9;
                end if;
             when 8 =>
                Shift = '1';
                nextstate <= 9;
            when 9 =>
                if (M = '1') then
                    Add1 <= '1';
                    nextstate <= 10;
                else
                    Shift <= '1';
                    nextstate <= 11;
                end if;
            when 10 =>
                Shift = '1';
                nextstate <= 11;
            when 11 =>
                Done <= '1';
                nextstate <= 11;
            when 12 =>
                Add2 <= '1';
                nextstate <= 0;
        end case;
    end process;
 
    process (clk, rst)
    begin
        -- active-low asynchronous clear
        if (rst = '0') then 
            state <= 0;
        -- rising edge trigger
        elsif rising_edge(clk) then
            state <= nextstate;
        end if;
    end process;
end SM_a;
