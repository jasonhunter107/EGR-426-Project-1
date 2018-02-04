----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2018 02:42:16 PM
-- Design Name: 
-- Module Name: 2HzClkDivider - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity twoHzClkDivider is
    Port ( clk : in STD_LOGIC;
           output : out STD_LOGIC
           );
end twoHzClkDivider;

architecture Behavioral of twoHzClkDivider is

--Using equation --  (speed/desiredSpeed)/2 = (100 Mhz/ 2 Hz)/2 = 24,999,999 cycles.
signal clkPreScaler: STD_LOGIC_VECTOR (27 downto 0) := X"17D783F";
signal clkCounter: STD_LOGIC_VECTOR (27 downto 0) := (others => '0');
signal count : STD_LOGIC := '0';

begin

newClock: process (clk, count)
begin
    if rising_edge(clk) then
    clkCounter <= clkCounter + 1;
        if (clkCounter > clkPreScaler) then
        count <= not count;
        clkCounter <= (others => '0');
        end if;
    end if;
end process;

output <= count;



end Behavioral;
