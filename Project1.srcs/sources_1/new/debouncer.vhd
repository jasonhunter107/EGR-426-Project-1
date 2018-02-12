----------------------------------------------------------------------------------
-- Company: GVSU
-- Engineer: Jason Hunter
-- 
-- Create Date: 01/24/2018 01:06:39 AM
-- Design Name: Scrolling Marquee
-- Module Name: debouncer
-- Project Name: EGR-426-Project-1
-- Target Devices: Artix 7
-- Description: A debouncer used for the center button
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debouncer is
    Port ( btn : in STD_LOGIC; --Center button value
           cclk : in STD_LOGIC; --100Mhz clock
           clr : in STD_LOGIC; --clear (never used)
           outpt : out STD_LOGIC); --output of debouncer
end debouncer;

architecture Behavioral of debouncer is

--signal for each register
signal delay1, delay2, delay3 : STD_LOGIC;
begin
process (cclk, clr)
    begin
    --If clear is high then reset of registers to 0
    if (clr = '1')then
        delay1 <= '0';
        delay2 <= '0';
        delay3 <= '0';
    --If the button is pressed then shift the input with 3 registers
    elsif (cclk'event and cclk = '1') then
        delay1 <= btn; --Register 1 holds button input
        delay2 <= delay1; --Previous input from reigster 1 is stored here
        delay3 <= delay2; --Previous input from reigster 2 is stored here
   end if;
end process;

--AND the results to make sure there are no debounces in between shifting sequence
outpt <= (delay1 and delay2) and delay3;

end Behavioral;
