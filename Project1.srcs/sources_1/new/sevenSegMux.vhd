----------------------------------------------------------------------------------
-- Company: GVSU
-- Engineer: Jason Hunter
-- 
-- Create Date: 01/31/2018 01:26:39 AM
-- Design Name: Scrolling Marquee
-- Module Name: sevenSegMux
-- Project Name: EGR-426-Project-1
-- Target Devices: Artix 7
-- Description: A multiplexer used to display the letters on all four seven segment LEDS
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSegMux is
    Port ( inputs : in STD_LOGIC_VECTOR (15 downto 0); --THe current 4 letters that is going to be displayed
           s : in STD_LOGIC_VECTOR (1 downto 0); --switch signal for mux
           letter : out STD_LOGIC_VECTOR (3 downto 0); --each letter that is going to be put through decoder
           an : out STD_LOGIC_VECTOR (3 downto 0); --AN signal of seven segment LED
           dp : out STD_LOGIC --DP signal of seven segment LED
           );
end sevenSegMux;

architecture Behavioral of sevenSegMux is

--Created temporary variables to assign to output later
signal tempLetter : STD_LOGIC_VECTOR (3 downto 0); 
signal tempAn : STD_LOGIC_VECTOR (3 downto 0); 
signal tempDp : STD_LOGIC := '1'; 
begin
process (s)
begin
    --Switch statement for select signal. Counter repeatedly switchs s to make it look like
    --  all seven segment LED's are on
    case s is
    when "00" => tempLetter <= inputs (15 downto 12); tempAn <= "0111"; --Display letter on first sev seg
    when "01" => tempLetter <= inputs (11 downto 8); tempAn <= "1011"; --Display letter on second sev seg
    when "10" => tempLetter <= inputs (7 downto 4); tempAn <= "1101"; --Display letter on third sev seg
    when others => tempLetter <= inputs (3 downto 0); tempAn <= "1110"; --Display letter on fourth sev seg
    end case;
end process;

--Assign temp variables to output
letter <= tempLetter;
an <= tempAn;
dp <= tempDp;


end Behavioral;
