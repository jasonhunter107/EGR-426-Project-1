----------------------------------------------------------------------------------
-- Company: GVSU
-- Engineer: Jason Hunter
-- 
-- Create Date: 01/23/2018 11:31:10 PM
-- Design Name: Scrolling Marquee
-- Module Name: counter_tb
-- Project Name: EGR-426-Project-1
-- Target Devices: Artix 7
-- Description: Testbench for counter
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use ieee.std_logic_textio.all;

entity counter_tb is
end counter_tb;

architecture Behavioral of counter_tb is

component counter
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC; 
           output : out STD_LOGIC_VECTOR (1 downto 0)
           );
end component;

--Temporary signals that are going to be assigned after for the component
signal clk: STD_LOGIC := '0';
signal reset : STd_LOGIC := '1';
signal tempOutput : STD_LOGIC_VECTOR (1 downto 0);

--Clock frequency
CONSTANT CLK_period : time := 10 ns;

--Creates the file logging for the simulation. The parameters is output of the debouncer
procedure Monitor(ShouldBe: in STD_LOGIC_VECTOR) is

variable lout: line;

--Creates the table of inputs and outputs
begin
WRITE (lout, NOW, right, 10, ns);
WRITE (lout, string'(" clk --> "));
WRITE (lout, clk);
WRITE (lout, string'(" output --> "));
WRITE (lout, tempOutput);
WRITELINE(OUTPUT, lout);

--Print statement when output has the wrong output
Assert tempOutput = Shouldbe REPORT "Test failed" SEVERITY FAILURE;

end Monitor;


begin

--Instantiate component
C1: counter port map(clk => clk, reset => reset,output => tempOutput);

--Process to create clock for debouncer simulation using clock frequency of 100MHz
clk_period2: process
begin
    clk <= '0';
    wait for CLK_period/2;
    clk <= '1';
    wait for CLK_period/2;
end process;

--Begin simulation
stim_proc: process
begin
    
   wait for 100 ns;
   reset <= '0';
    
    --wait for 10 ns;
    --Monitor("0001");
    
  --  wait for 10 ns;
   -- Monitor("0010");
    
    wait for CLK_period * 100;

  --End simulation
end process;

end Behavioral;

