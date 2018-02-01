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
use std.textio.all;
use ieee.std_logic_textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_tb is
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is

component counter
    Port ( clk : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;

signal clk: STD_LOGIC := '0';
signal tempOutput : STD_LOGIC_VECTOR (3 downto 0);
CONSTANT CLK_period : time := 10 ns;

procedure Monitor(ShouldBe: in STD_LOGIC_VECTOR) is

variable lout: line;

begin
WRITE (lout, NOW, right, 10, ns);
WRITE (lout, string'(" clk --> "));
WRITE (lout, clk);
WRITE (lout, string'(" output --> "));
WRITE (lout, tempOutput);
WRITELINE(OUTPUT, lout);

Assert tempOutput = Shouldbe REPORT "Test failed" SEVERITY FAILURE;

end Monitor;


begin

                                --Initiate test
-------------------------------------------------------------------------
C1: counter port map(clk => clk, output => tempOutput);

clk_period2: process
begin
    clk <= '0';
    wait for CLK_period/2;
    clk <= '1';
    wait for CLK_period/2;
end process;

stim_proc: process
begin
    
    wait for 100 ns;
    
    wait for CLK_period * 10;

end process;

end Behavioral;

