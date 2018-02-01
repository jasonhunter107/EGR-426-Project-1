----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/29/2018 06:17:38 PM
-- Design Name: 
-- Module Name: halfSecCounter_tb - Behavioral
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

entity halfSecCounter_tb is
--  Port ( );
end halfSecCounter_tb;

architecture Behavioral of halfSecCounter_tb is

component halfSecCounter
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (1 downto 0)
           );
end component;

signal clk, reset : STD_LOGIC := '0';
signal output : STD_LOGIC;

procedure Monitor(ShouldBe: in STD_LOGIC) is

variable lout: line;

begin

-- insert monitor code

end Monitor;


begin

                                --Initiate test
-------------------------------------------------------------------------
C1: halfSecCounter portmap(clk => clk, reset => reset, output => output);

stim_proc: process
begin

--insert simulation code here

end process;

end Behavioral;

