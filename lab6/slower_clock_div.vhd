-- Poulami Das 
-- Created on 10/11/2015
-- Clock divider that generates a 0.1 Hz Clock signal from 100 MHz clock input

library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity clock_divider is
port(clock_100Mhz: in STD_LOGIC;
     clock_1Hz: out STD_LOGIC
     );
end clock_divider;


architecture behaviour of clock_divider is
signal count : integer range 0 to 500000000;
signal gen_clk : std_logic :='0';
begin
clock_1Hz <= gen_clk;

  process(clock_100Mhz)
  begin
    if clock_100Mhz = '1' and clock_100Mhz'event then
	if (count = 500000000) then 
            gen_clk <= not(gen_clk);
            count <= 0;
        else 
	    count <= count + 1;
        end if;
    end if;
 end process;
end behaviour;

