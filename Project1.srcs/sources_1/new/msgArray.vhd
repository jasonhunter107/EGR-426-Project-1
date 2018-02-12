----------------------------------------------------------------------------------
-- Company: GVSU
-- Engineer: Jason Hunter
-- 
-- Create Date: 02/04/2018 12:02:06 PM
-- Design Name: Scrolling Marquee
-- Module Name: fiftyMHzClkDivder
-- Project Name: EGR-426-Project-1
-- Target Devices: Artix 7
-- Description: A clock divider that divides 100MHz to 50MHz
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity msgArray is
    Port ( clk : in STD_LOGIC; --clock of 50Mhz
           btn : in STD_LOGIC; --Center button
           msgOutput : out STD_LOGIC_VECTOR (15 downto 0)); --Output of four letters (since board only has 4 sev seg LED's)
end msgArray;

architecture Behavioral of msgArray is

--Vector that holds the value of the bits (in HEX) that represents JASON HUNTER
signal tempMsg: STD_LOGIC_VECTOR (0 to 67) := X"01234F56789AFFFFF";

--Signal that holds clock value
signal tempClk : STD_LOGIC;

begin

process (btn, clk)
begin

--Assign 50MHz clock
tempClk <= clk;
    
    --When user holds button down then keep the clk constant
    if (btn = '1') then
    tempClk <= tempClk;
    
    --Shift the letter array by 4 bits every clock cycle (representing a left scroll of name on board)
    elsif (tempClk'event and tempClk = '1') then
        tempMsg (0 to 63) <= tempMsg (4 to 67);
        tempMsg (64 to 67) <= tempMsg (0 to 3);
        
    end if;
 end process;
 
 --Output the current 4 letters of the name
 msgOutput <= tempMsg (0 to 15);


end Behavioral;
