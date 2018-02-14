----------------------------------------------------------------------------------
-- Company: GVSU
-- Engineer: Jason Hunter
-- 
-- Create Date: 01/23/2018 11:31:10 PM
-- Design Name: Scrolling Marquee
-- Module Name: debouncer_tb
-- Project Name: EGR-426-Project-1
-- Target Devices: Artix 7
-- Description: Testbench for debouncer
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use ieee.std_logic_textio.all;

entity debouncer_tb is
end debouncer_tb;

architecture Behavioral of debouncer_tb is

component debouncer 
    Port ( btn : in STD_LOGIC;
           cclk : in STD_LOGIC;
           clr : in STD_LOGIC;
           outpt : out STD_LOGIC);
end component;

--Temporary signals that are going to be assigned after for the component
signal btn, cclk, clr : STD_LOGIC := '0';
signal outpt : STD_LOGIC;

--Clock frequency
CONSTANT clk : time := 10 ns;

--Creates the file logging for the simulation. The parameters are the three outputs of the multiplexer
procedure Monitor(ShouldBe: in STD_LOGIC) is

variable lout: line;

--Creates the table of inputs and outputs
begin
WRITE(lout, NOW, right, 10, ns);
WRITE(lout, string' (" |btn -->"));
WRITE(lout, btn);
WRITE(lout, string' (" |cclk -->"));
WRITE(lout, cclk);
WRITE(lout, string' (" |clr -->"));
WRITE(lout, clr);
WRITE(lout, string' (" |output expected value -->"));
WRITE(lout, outpt);
WRITE(lout, string' (" |output observant value -->"));
WRITE(lout, ShouldBe);
WRITELINE(OUTPUT, lout);

--Print statement when output has the wrong output
Assert outpt = ShouldBe REPORT "Test Failed: output observant value is not equal to expected value" SEVERITY FAILURE;

end Monitor;

begin

--Instantiate multiplexer
D1: debouncer port map (btn => btn, cclk => cclk, clr => clr, outpt => outpt);

--Process to create clock for debouncer simulation using clock frequency of 100MHz
clk_period: process
begin
    cclk <= '0';
    wait for clk/2;
    cclk <= '1';
    wait for clk/2;
end process;

--Begin simulation
stim_proc: process
begin

--Begin simulation by assigning values to inputs and reading the outputs
    wait for 100 ns;
    clr <= '0';
    REPORT "Beginning of debouncer test" SEVERITY NOTE;
    
    wait for clk*10;
    
    wait for 10 ns;
    btn <= '1';
    --make sure to wait for atleast 3 clock cycles in order for the debouncer to work
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
    
    --Test should fail here, we assigned button to 1 (pressed down), however we inserted 0 for the output
    wait for 20 ns;
    btn <= '1';
    wait for 40 ns;
    Monitor('0'); --should be 1
    
    wait for 10 ns;
    btn <= '0';
    wait for 40 ns;
    Monitor('0');
    
    
    
  --End simulation
  wait;
  

end process;


end Behavioral;
