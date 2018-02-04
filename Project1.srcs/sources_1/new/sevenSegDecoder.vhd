----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2018 04:49:03 PM
-- Design Name: 
-- Module Name: sevenSegDecoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSegDecoder is
    Port (
    input_s : in STD_LOGIC_VECTOR (3 downto 0);
    optLetter : out STD_LOGIC_VECTOR (6 downto 0)
    );
end sevenSegDecoder;

architecture Behavioral of sevenSegDecoder is

begin

process (input_s)
begin

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
