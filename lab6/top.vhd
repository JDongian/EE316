-- Poulami Das 
-- Created on 10/11/2015
-- Top level wrapper that comprises of the design and a clock divider. 
-- The slow clock is used to clock the design

library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Top is
port(clock_100Mhz, reset, X: in STD_LOGIC;
     clk_1Hz, output_val, state3, state2, state1: out STD_LOGIC
     );
end Top;

architecture connection of Top is
-- declare State machine design and clock divider as component
component SM 
port(x, clk, rst: in STD_LOGIC;

	Z, Q3, Q2, Q1: out STD_LOGIC
	);
end component;

component clock_divider 
port(clock_100Mhz: in STD_LOGIC;
     clock_1Hz: out STD_LOGIC
     );
end component;

-- internal signals
signal slow_clock : std_logic;

begin
 clk_1Hz <= slow_clock;
 clock_div_inst : clock_divider port map(clock_100Mhz, slow_clock);
 state_machine : SM port map (x=> X, 
                              clk=> slow_clock, 
                              rst=> reset, 
                              Z=> output_val, 
                              Q3=> state3, 
                              Q2=> state2, 
                              Q1=> state1);

end connection;