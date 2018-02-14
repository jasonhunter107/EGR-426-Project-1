----------------------------------------------------------------------------------
-- Company: GVSU
-- Engineer: Jason Hunter
-- 
-- Create Date: 01/11/2018 06:42:49 PM
-- Design Name: Scrolling Marquee
-- Module Name: counter
-- Project Name: EGR-426-Project-1
-- Target Devices: Artix 7
-- Description: A 2-bit counter that is connected to the an port of the MUX
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity counter is
    Port ( clk : in STD_LOGIC; --100MHz clock
           reset : in STD_LOGIC; --reset (never used)
           output : out STD_LOGIC_VECTOR (1 downto 0)); --Output of the counter
end counter;

architecture Behavioral of counter is

--Temp variables for counter
SIGNAL temp: STD_LOGIC_VECTOR (1 downto 0) := "00"; 
signal clkpreScaler : STd_LOGIC_VECTOR (11 downto 0) := X"7FE";
signal tempV : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
begin 

--A mini clock divider for the counter to slow it down
process(clk)
 begin
   --If reset is 1 then reset temp
   if (reset = '1') then
   temp <= "00";
   --Once clock divider reach its max then increment counter
 elsif rising_edge(clk) then
    tempV <= tempV + 1;
    if ( tempV > clkpreScaler) then
       temp <= temp + 1;
       tempV <= (others => '0');
       end if;
 end if;
    
  end process;
    
--Assign counter to output
 output <= temp;


end Behavioral;