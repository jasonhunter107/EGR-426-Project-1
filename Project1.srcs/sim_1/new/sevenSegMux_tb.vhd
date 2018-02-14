----------------------------------------------------------------------------------
-- Company: GVSU
-- Engineer: Jason Hunter
-- 
-- Create Date: 01/23/2018 11:31:10 PM
-- Design Name: Scrolling Marquee
-- Module Name: sevenSegMux_tb
-- Project Name: EGR-426-Project-1
-- Target Devices: Artix 7
-- Description: Testbench for multiplexer
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use ieee.std_logic_textio.all;


entity sevenSegMux_tb is
end sevenSegMux_tb;

architecture Behavioral of sevenSegMux_tb is

component sevenSegMux 
    Port ( inputs : in STD_LOGIC_VECTOR (15 downto 0); 
           s : in STD_LOGIC_VECTOR (1 downto 0); 
           letter : out STD_LOGIC_VECTOR (3 downto 0); 
           an : out STD_LOGIC_VECTOR (3 downto 0); 
           dp : out STD_LOGIC 
           );
end component;

--Temporary signals that are going to be assigned after for the component
signal s : STD_LOGIC_VECTOR (1 downto 0);
signal inputs : STD_LOGIC_VECTOR (15 downto 0);
signal letter, an: STD_LOGIC_VECTOR (3 downto 0);
signal dp : STD_LOGIC := '1';

--Creates the file logging for the simulation. The parameters are the three outputs of the multiplexer
Procedure Monitor (Shouldbe: in STD_LOGIC_VECTOR (3 downto 0);
                     Shouldbe1: in STD_LOGIC_VECTOR (3 downto 0);
                     Shouldbe2: in STD_LOGIC) is
Variable lout: line;

--Creates the table of inputs and outputs
begin
WRITE(lout, now, right, 10, ns);
WRITE(lout, string'(" |inputs --> "));
WRITE(lout, inputs);
WRITE(lout, string'(" |s --> "));
WRITE(lout, s);
WRITE(lout, string'(" |'letter' expected value --> "));
WRITE(lout, letter);
WRITE(lout, string'(" |'letter' observant value --> "));
WRITE(lout, Shouldbe);
WRITE(lout, string'(" |'an' expected value--> "));
WRITE(lout, an);
WRITE(lout, string'(" |'an' observant value--> "));
WRITE(lout, Shouldbe1);
WRITE(lout, string'(" |'dp' expected value --> "));
WRITE(lout, dp);
WRITE(lout, string'(" |'dp' observant value --> "));
WRITE(lout, Shouldbe2);
WRITELINE(OUTPUT, lout);

--Print statement when letter has the wrong output
Assert letter = Shouldbe Report "letter observant value is not equal to expected value" SEVERITY FAILURE;

--Print statement when an has the wrong output
Assert an = Shouldbe1 Report "an observant value is not equal to expected value" SEVERITY FAILURE;

--Print statement when dp has the wrong output
Assert dp = Shouldbe2 Report "dp observant value is not equal to expected value" SEVERITY FAILURE;

end Monitor;


begin

--Instantiate multiplexer
M1: sevenSegMux port map (inputs => inputs, s => s, letter => letter, an => an, dp => dp);

--Begin simulation
stim_proc: process
begin

wait for 100 ns;

--Begin simulation by assigning values to inputs and reading the outputs
Report "Beginning MUX test" SEVERITY NOTE;

    s <= "00";
    inputs <= X"0123";
    wait for 20 ns;
    Monitor("0000","0111",'1');
    
    s <= "01";
    wait for 20 ns;
    Monitor("0001","1011",'1');
    
     --This test should fail right here due to having the wrong output (letter) on monitor
    s <= "10";
    wait for 20 ns;
    Monitor("1111","1111",'1'); --should be ("0010","1101",'1');
    
    s <= "11";
    wait for 20 ns;
    Monitor("0011","1110",'1');
    
    
    --End simulation
    wait;
    
 end process;
    


end Behavioral;
