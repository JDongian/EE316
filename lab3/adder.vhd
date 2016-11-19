library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- 2 Input nand gate
entity adder is 
        port (
        A: in std_logic_vector(7 downto 0);
        B: in std_logic_vector(7 downto 0);
        C: out STD_LOGIC;
        N: out std_logic_vector(7 downto 0)                     
        );
end adder;
architecture behavior of adder is
	signal C1,C2,C3,C4,C5,C6,C7: STD_LOGIC;
	
    component add1
    port (
        A: in STD_LOGIC;
        B: in STD_LOGIC;
        Cin: in STD_LOGIC;
        S: out STD_LOGIC;
        Cout: out STD_LOGIC
    );
    end component;
    
begin
    -- chain 8 full 1 bit adders
	VHDL_Device_0: add1 port map (A(0), B(0), '0', N(0), C1);
    VHDL_Device_1: add1 port map (A(1), B(1), C1, N(1), C2);
    VHDL_Device_2: add1 port map (A(2), B(2), C2, N(2), C3);
    VHDL_Device_3: add1 port map (A(3), B(3), C3, N(3), C4);
    VHDL_Device_4: add1 port map (A(4), B(4), C4, N(4), C5);
    VHDL_Device_5: add1 port map (A(5), B(5), C5, N(5), C6);
    VHDL_Device_6: add1 port map (A(6), B(6), C6, N(6), C7);
    VHDL_Device_7: add1 port map (A(7), B(7), C7, N(7), C);
end behavior;