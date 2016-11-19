library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

--library SimUAid_synthesis;
--use SimUAid_synthesis.SimuAid_synthesis_pack.all;

entity ent1 is
port(X: in STD_LOGIC_VECTOR(7 downto 0);
     O: out STD_LOGIC_VECTOR(10 downto 0)
	);
end ent1;
architecture Structure of ent1 is
	signal Y, L, N: STD_LOGIC_VECTOR(7 downto 0);
	signal U1: STD_LOGIC_VECTOR(2 downto 0);
	signal M, C, Z: STD_LOGIC;
	
    component incr
    port (
            Z: in STD_LOGIC;
            M: in STD_LOGIC;
            C: in STD_LOGIC;
            O: out STD_LOGIC_VECTOR(2 downto 0)
                                    
    );
    end component;
    
    component shift
    port (
            A: in STD_LOGIC_VECTOR(7 downto 0);
            R: in STD_LOGIC;
            B: out STD_LOGIC_VECTOR(7 downto 0);
            L: out STD_LOGIC
    );
    end component;

    component adder
    port (
            A: in STD_LOGIC_VECTOR(7 downto 0);
            B: in STD_LOGIC_VECTOR(7 downto 0);
            C: out STD_LOGIC;
            N: out STD_LOGIC_VECTOR(7 downto 0)
    );
    end component;

begin
    -- multiply by 4
    VHDL_Device_0: shift port map (X, '0', Y, Z);
    VHDL_Device_1: shift port map (Y, '0', L, M);
    -- now Z:M:L is input X * 4.

    -- there is a pre-existing adder, but this is my own 8 bit adder
    -- add X to X * 4, getting X * 5
    VHDL_Device_2: adder port map (L, X, C, N);

    -- handle the carry from the adder
    VHDL_Device_3: incr port map (Z, M, C, U1);

    -- put the output bits in the right places
    -- is there a better way to do this?
    O(0) <= N(0);
    O(1) <= N(1);
    O(2) <= N(2);
    O(3) <= N(3);
    O(4) <= N(4);
    O(5) <= N(5);
    O(6) <= N(6);
    O(7) <= N(7);

    -- these bits come from the carries
    O(8) <= U1(0);
    O(9) <= U1(1);
    O(10) <= U1(2);
end Structure;