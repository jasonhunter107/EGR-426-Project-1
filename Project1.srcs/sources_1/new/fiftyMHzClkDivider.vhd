----------------------------------------------------------------------------------
-- Company: GVSU
-- Engineer: Jason Hunter
-- 
-- Create Date: 02/04/2018 02:42:16 PM
-- Design Name: Scrolling Marquee
-- Module Name: fiftyMHzClkDivder
-- Project Name: EGR-426-Project-1
-- Target Devices: Artix 7
-- Description: A clock divider that divides 100MHz to 50MHz
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity fiftyMHzClkDivider is
    Port ( clk : in STD_LOGIC; --100MHz clock
           output : out STD_LOGIC --Output of 50Mhz clock divider 
           );
end fiftyMHzClkDivider;

architecture Behavioral of fiftyMHzClkDivider is

--Since 100MHz = 1 second we want 0.5 seconds so make counter count up to 49,999,999 cycles
-- Since we start at 0, we want to count up to 49,999,999
signal clkPreScaler: STD_LOGIC_VECTOR (27 downto 0) := X"2FAF07F"; --Hex value of 49,999,999 cycles
signal clkCounter: STD_LOGIC_VECTOR (27 downto 0) := (others => '0'); --Clock counter
signal count : STD_LOGIC := '0'; --output

begin

newClock: process (clk, count)
begin
    --Increment the counter every rising edge of clock
    if rising_edge(clk) then
    clkCounter <= clkCounter + 1;
    --If the counter reached maximum value then reset clock counter and toggle count
        if (clkCounter > clkPreScaler) then
        count <= not count;
        clkCounter <= (others => '0');
        end if;
    end if;
end process;

--Assign count to output
output <= count;



end Behavioral;
