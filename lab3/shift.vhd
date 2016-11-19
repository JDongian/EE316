library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- 2 Input nand gate
entity shift is 
        port (
            A: in std_logic_vector(7 downto 0);
            R: in STD_LOGIC;
            B: out std_logic_vector(7 downto 0);
            L: out STD_LOGIC                        
        );
end shift;
architecture behavior of shift is   
begin
	B(0) <= R;
	B(1) <= A(0);
    B(2) <= A(1);
    B(3) <= A(2);
    B(4) <= A(3);
    B(5) <= A(4);
    B(6) <= A(5);
    B(7) <= A(6);
    L <= A(7);
end behavior;