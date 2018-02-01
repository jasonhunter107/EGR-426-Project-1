----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/11/2018 06:42:49 PM
-- Design Name: 
-- Module Name: counter_vhdl - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--scale = fin / fout
--where fin is freqeuncy from board and fout is desired frequency
--(i.e (50 Mhz/ 200Hz) = 250000 cycles
--signal counter : integer range 0 to 124999 := 0;
--used 124999 becyase its 50% duty cycle and counter begins at 0 so its 124999 not 125000.

entity counter is
    Port ( clk : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is

SIGNAL temp: STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin 
    process(clk)
    begin
        if (rising_edge(clk)) then
        temp <= temp + 1;
        end if;
    end process;
    
    output <= temp;


end Behavioral;