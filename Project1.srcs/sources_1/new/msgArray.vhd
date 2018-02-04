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
           btn : in STD_LOGIC;
           msgOutput : out STD_LOGIC_VECTOR (15 downto 0));
end msgArray;

architecture Behavioral of msgArray is

--signal tempMsg : STD_LOGIC_VECTOR (0 to 63);

--Vector that holds the value of the bits (in HEX) that represents JASON HUNTER
signal tempMsg: STD_LOGIC_VECTOR (0 to 63) := X"01234F56789AFFFF";
signal tempClk : STD_LOGIC;


begin

process (btn, clk)
begin

tempClk <= clk;

    if (btn = '1') then
    tempClk <= tempClk;
    
    elsif (tempClk'event and tempClk = '1') then
        tempMsg (0 to 59) <= tempMsg (4 to 63);
        tempMsg (60 to 63) <= tempMsg (0 to 3);
        
    end if;
 end process;
 
 msgOutput <= tempMsg (0 to 15);


end Behavioral;
