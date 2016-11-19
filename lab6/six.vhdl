library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;


entity SM is
    port(F, clk, rst: in std_logic;
         Z, Q1, Q2, Q3: out std_logic);
end SM;

architecture SM_a of SM is
    -- much cleaner than flip flops, but there is still a homomorphism
    signal state, nextstate: integer range 0 to 5 := 0;
    signal state_bits: std_logic_vector(2 downto 0);
begin
    process (state, F)
    begin
        Z <= '1';
        case state is
            when 0 =>
                Z <= '0';
                nextstate <= 1;
            when 1 =>
                Z <= '0';
                -- If F=0, output signal x2
                if (F = '0') then
                    nextstate <= 4;
                -- If F=1, output signal x3
                else
                    nextstate <= 2;
                end if;
            when 2 =>
                Z <= '0';
                -- If F=0, output signal x2
                if (F = '0') then
                    nextstate <= 0; -- reset
                -- If F=1, output signal x3
                else
                    nextstate <= 3;
                end if;
            when 3 =>
                -- If F=0, output signal x2
                if (F = '0') then
                    nextstate <= 0; -- reset
                -- If F=1, output signal x3
                else
                    nextstate <= 4;
                end if;
            when 4 =>
                nextstate <= 5;
            when 5 =>
                nextstate <= 0;
        end case;
        -- the state homomorphism
        -- just for the lab requirement
        state_bits <= std_logic_vector(to_unsigned(state, 3));
        Q1 <= state_bits(0);
        Q2 <= state_bits(1);
        Q3 <= state_bits(2);
    end process;
 
    -- use every clock edge (rising and falling).
    -- don't trigger on rst since it's a synchronous input
    process (clk)
    begin
        -- active-high synchronous clear
        if (rst = '1') then 
            state <= 0;
        else
            state <= nextstate;
        end if;
    end process;
end SM_a;
