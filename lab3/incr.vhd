-- do a thing where C is added to Z:M

library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity incr is 
        port (
            Z: in STD_LOGIC;
            M: in STD_LOGIC;
            C: in STD_LOGIC;
            O: out std_logic_vector(2 downto 0)       
        );
end incr;
architecture behavior of incr is   
	signal A: STD_LOGIC;
begin
	A <= M and C;
    O(0) <= M xor C;   
    O(1) <= Z xor A;        
    O(2) <= Z and M and C;
end behavior;