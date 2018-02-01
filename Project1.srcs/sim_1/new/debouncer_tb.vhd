----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/29/2018 05:55:53 PM
-- Design Name: 
-- Module Name: debouncer_tb - Behavioral
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

entity debouncer_tb is
--  Port ( );
end debouncer_tb;

architecture Behavioral of debouncer_tb is

component debouncer 
    Port ( btn : in STD_LOGIC;
           cclk : in STD_LOGIC;
           clr : in STD_LOGIC;
           outpt : out STD_LOGIC);
end component;

signal btn, cclk, clr : STD_LOGIC := '0';
signal outpt : STD_LOGIC;

CONSTANT clk : time := 10 ns;

procedure Monitor(ShouldBe: in STD_LOGIC) is

variable lout: line;

begin
WRITE(lout, NOW, right, 10, ns);
WRITE(lout, string' (" btn -->"));
WRITE(lout, btn);
WRITE(lout, string' (" cclk -->"));
WRITE(lout, cclk);
WRITE(lout, string' (" clr -->"));
WRITE(lout, clr);
WRITE(lout, string' (" output -->"));
WRITE(lout, outpt);
WRITELINE(OUTPUT, lout);
Assert outpt = ShouldBe REPORT "Test Failed" SEVERITY FAILURE;

end Monitor;

begin

D1: debouncer port map (btn => btn, cclk => cclk, clr => clr, outpt => outpt);

clk_period: process
begin
    cclk <= '0';
    wait for clk/2;
    cclk <= '1';
    wait for clk/2;
end process;


stim_proc: process
begin
    wait for 100 ns;
    REPORT "Beginning of debouncer test" SEVERITY NOTE;
    
    wait for clk*10;
    
    wait for 10 ns;
    btn <= '1';
    wait for 20 ns;
    btn <= '0';
    
    wait for 10 ns;
    btn <= '1';
    wait for 50 ns;
    Monitor('1');
    
    wait for 20 ns;
    btn <= '0';
    wait for 40 ns;
    Monitor('0');
    
    wait for 20 ns;
    btn <= '1';
    wait for 40 ns;
    Monitor('0'); --should be 1
    
    wait for 10 ns;
    btn <= '0';
    wait for 40 ns;
    Monitor('0');
    
    
  wait;
  

end process;


end Behavioral;
