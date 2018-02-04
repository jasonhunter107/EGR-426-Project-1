----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2018 01:26:39 AM
-- Design Name: 
-- Module Name: sevenSegMux - Behavioral
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

entity sevenSegMux is
    Port ( inputs : in STD_LOGIC_VECTOR (15 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           letter : out STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0)
           );
end sevenSegMux;

architecture Behavioral of sevenSegMux is

signal tempLetter : STD_LOGIC_VECTOR (3 downto 0);
signal tempAn : STD_LOGIC_VECTOR (3 downto 0);

begin

process (s)
begin
    case s is
--    when "00" => tempLetter <= "0000"; tempAn <= "0111";
--    when "01" => tempLetter <= "0001"; tempAn <= "1011";
--    when "10" => tempLetter <= "0010"; tempAn <= "1101";
--    when others => tempLetter <= "0011"; tempAn <= "1110";
    when "00" => tempLetter <= inputs (15 downto 12); tempAn <= "0111";
    when "01" => tempLetter <= inputs (11 downto 8); tempAn <= "1011";
    when "10" => tempLetter <= inputs (7 downto 4); tempAn <= "1101";
    when others => tempLetter <= inputs (3 downto 0); tempAn <= "1110";
    end case;
end process;

letter <= tempLetter;
an <= tempAn;


end Behavioral;
