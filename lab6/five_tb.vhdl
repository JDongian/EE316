library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


--  A testbench has no ports.
entity five_tb is
    end five_tb;

architecture behav of five_tb is
    component SM
        port(rst, clk, X: in std_logic;
        Q1, Q2, Q3, Z: out std_logic);
    end component;

    --  Specifies which entity is bound with the component.
    for five_0: SM use entity work.SM;
        signal rst, clk, X: std_logic;
        signal Z: std_logic;
    begin
    five_0: SM port map (X=>X, clk=>clk, rst=>rst, Z=>Z);

    process
    type pattern_type is record
        --  inputs
        rst, clk, X : std_logic;
        --  The expected outputs of the adder.
        Z : std_logic;
    end record;
    --  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
    -- rst, clk, X, Z
    (('0', '0', '0', '0'),
     ('1', '1', '1', '0'),
     ('1', '0', '1', '0'),
     ('1', '1', '0', '1'),
     ('1', '0', '0', '1'),
     ('1', '1', '1', '1'),
     ('1', '0', '1', '1'),
     ('1', '1', '0', '0'),
     ('1', '0', '0', '0'),
     ('1', '1', '0', '1'),
     ('1', '0', '1', '0'),
     ('1', '1', '1', '0'),
     ('0', '0', '0', '0'),
     ('1', '1', '0', '1'),
     ('1', '0', '0', '1'),
     ('1', '1', '0', '0'),
     ('1', '0', '0', '0'),
     ('1', '1', '0', '0'),
     ('1', '0', '0', '0'),
     ('1', '1', '0', '0'),
     ('0', '0', '0', '0'),
     ('0', '1', '0', '0'),
     ('0', '0', '0', '0'),
     ('1', '1', '0', '1'),
     ('1', '0', '0', '1'),
     ('1', '1', '0', '0'),
     ('1', '0', '0', '0'),
     ('1', '1', '0', '0'),
     ('1', '0', '0', '0'),
     ('1', '1', '1', '1'),
     ('1', '0', '1', '1'),
     ('1', '1', '1', '0'),
     ('1', '0', '1', '0'),
     ('1', '1', '1', '0'),
     ('1', '0', '1', '0'),
     ('1', '1', '1', '1'),
     ('1', '0', '1', '1'),
     ('1', '1', '1', '1'),
     ('1', '0', '1', '1'),
     ('1', '1', '0', '1'),
     ('1', '0', '0', '1'),
     ('1', '1', '1', '1'),
     ('1', '0', '1', '1'),
     ('1', '1', '0', '0'),
     ('1', '0', '0', '0'),
     ('1', '1', '0', '0'),
     ('1', '0', '0', '0'),
     ('1', '1', '0', '1'),
     ('1', '0', '0', '1'),
     ('1', '1', '1', '1'),
     ('1', '0', '1', '1'),
     ('1', '1', '0', '0'));
    begin
        --  Check each pattern.
        for i in patterns'range loop
            --  Set the inputs.
            X <= patterns(i).X;
            clk <= patterns(i).clk;
            rst <= patterns(i).rst;
            --  Wait for the results.
            wait for 1 ns;
            --  Check the outputs.
            assert Z = patterns(i).Z
                report "incorrect output" severity error;
        end loop;
        assert false report "end of test" severity note;
        --  Wait forever; this will finish the simulation.
        wait;
    end process;
end behav;
