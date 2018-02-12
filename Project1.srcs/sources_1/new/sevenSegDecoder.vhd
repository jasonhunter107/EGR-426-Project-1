----------------------------------------------------------------------------------
-- Company: GVSU
-- Engineer: Jason Hunter
-- 
-- Create Date: 01/23/2018 11:31:10 PM
-- Design Name: Scrolling Marquee
-- Module Name: sevenSegDecoder
-- Project Name: EGR-426-Project-1
-- Target Devices: Artix 7
-- Description: Decodes the seven segment LED to display letters
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSegDecoder is
    Port (
    input_s : in STD_LOGIC_VECTOR (3 downto 0); --Letter in the name
    optLetter : out STD_LOGIC_VECTOR (6 downto 0) --Ouput of each letter that is going to be displayed on sev seg
    );
end sevenSegDecoder;

architecture Behavioral of sevenSegDecoder is

begin
process (input_s)
begin
    --Switch state for each letter in the name array which will be
    --  displayed on seven segment. Each letter turns on a seperate diode in
    --  each seven segment to make it look like that letter
    case input_s is
    when "0000" => optLetter <= "1000111"; --J
    when "0001" => optLetter <= "0001000"; --A
    when "0010" => optLetter <= "0100100"; --S
    when "0011" => optLetter <= "0000001"; --O
    when "0100" => optLetter <= "0001001"; --N
    when "0101" => optLetter <= "1001000"; --H
    when "0110" => optLetter <= "1000001"; --U
    when "0111" => optLetter <= "0001001"; --N
    when "1000" => optLetter <= "0001111"; --T
    when "1001" => optLetter <= "0110000"; --E
    when "1010" => optLetter <= "0111001"; --R
    when others => optLetter <= "1111111"; --Blank
    end case;
    
    
end process;


end Behavioral;
