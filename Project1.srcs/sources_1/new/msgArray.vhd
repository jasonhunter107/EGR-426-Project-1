----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2018 12:02:06 PM
-- Design Name: 
-- Module Name: msgArray - Behavioral
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

entity msgArray is
    Port ( clk : in STD_LOGIC;
           msgOutput : out STD_LOGIC_VECTOR (15 downto 0));
end msgArray;

architecture Behavioral of msgArray is

--signal tempMsg : STD_LOGIC_VECTOR (0 to 63);
signal tempMsg: STD_LOGIC_VECTOR (0 to 63) := X"01234F56789AFFFF"; --Vector that holds the value of the bits that represents JASON HUNTER


begin

process (clk)
begin
    if (rising_edge(clk)) then
        tempMsg (0 to 59) <= tempMsg (4 to 63);
        tempMsg (60 to 63) <= tempMsg (0 to 3);
    end if;
 end process;
 
 msgOutput <= tempMsg (0 to 15);


end Behavioral;
