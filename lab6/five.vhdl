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
    -- much cleaner than flip flops, but there is still a homomorphism
    signal state, nextstate: integer range 0 to 5 := 0;
    signal state_bits: std_logic_vector(2 downto 0);
begin
    process (state, X)
    begin
        case state is
            when 0 =>
                Z <= X;
                nextstate <= 1;
            when 1 =>
                Z <= not X;
                if (X = '0') then
                    nextstate <= 2;
                else
                    nextstate <= 3;
                end if;
            when 2 =>
                Z <= X;
                nextstate <= 4;
            when 3 =>
                Z <= not X;
                if (X = '0') then
                    nextstate <= 4;
                else
                    nextstate <= 5;
                end if;
            when 4 =>
                Z <= X;
                nextstate <= 0;
            when 5 =>
                Z <= '1';
                nextstate <= 0;
        end case;
        -- the state homomorphism
        state_bits <= conv_std_logic_vector(state,3);
        Q3 <= state_bits(2);
        Q2 <= state_bits(1);
        Q1 <= state_bits(0);
    end process;
 
    process (clk, rst)
    begin
        -- active-low asynchronous clear
        if (rst = '0') then 
            state <= 0;
        -- rising edge trigger
        elsif (clk = '1') then
            state <= nextstate;
        end if;
    end process;
end SM_a;
