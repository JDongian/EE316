-- do a thing where C is added to Z:M

library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity add1 is 
        port  (
        A: in STD_LOGIC;
        B: in STD_LOGIC;
        Cin: in STD_LOGIC;
        S: out STD_LOGIC;
        Cout: out STD_LOGIC
        );
end add1;
architecture behavior of add1 is   
	signal X: STD_LOGIC;
begin
    X <= A xor B;
    S <= X xor Cin;
	Cout <= (A and B) or (Cin and X);
end behavior;