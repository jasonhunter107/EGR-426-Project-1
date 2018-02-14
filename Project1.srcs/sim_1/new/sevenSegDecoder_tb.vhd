----------------------------------------------------------------------------------
-- Company: GVSU
-- Engineer: Jason Hunter
-- 
-- Create Date: 01/23/2018 11:31:10 PM
-- Design Name: Scrolling Marquee
-- Module Name: sevenSegDecoder_tb
-- Project Name: EGR-426-Project-1
-- Target Devices: Artix 7
-- Description: Testbench for seven segment decoder
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use ieee.std_logic_textio.all;

entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;

architecture Behavioral of sevenSegDecoder_tb is

component sevenSegDecoder 
    Port (
    input_s : in STD_LOGIC_VECTOR (3 downto 0);
    optLetter : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;

--Temporary signals for input/output of component
signal input_s : STD_LOGIC_VECTOR (3 downto 0);
signal optLetter : STD_LOGIC_VECTOR (6 downto 0);

--Creates the file logging for the simulation. The parameters is the output of the decoder
Procedure Monitor (Shouldbe: in std_logic_vector) is
Variable lout: line;

--Create the table of values
begin
WRITE (lout, NOW, right, 10, ns);
WRITE (lout, string'(" |input_s value --> "));
WRITE (lout, input_s);
WRITE (lout, string'(" |optLetter value --> "));
WRITE (lout, optLetter);
WRITE (lout, string'(" |optLetter expected value --> "));
WRITE (lout, optLetter);
WRITE (lout, string'(" |optLetter observant value --> "));
WRITE (lout, Shouldbe);
WRITELINE(OUTPUT, lout);

--If test fails, dispplay fail message
Assert optLetter = Shouldbe REPORT "Test failed, optLetter observant value doesn't match expected value" SEVERITY FAILURE;

end Monitor;

begin

--Instantiate seven segement component
uut: sevenSegDecoder port map(input_s => input_s, optLetter => optLetter);

stim_proc: process
begin
    --Wait 100ns then begin test
    wait for 100 ns;
    Report "Beginning Seven Segment Decoder test" SEVERITY NOTE;
    
    --Assign a value for input and wait 1ns
    --Output to monitor the expected value
 ---------------------------------------------------------
     input_s <= "0000";
     wait for 1 ns;
     Monitor ("1000111");
     
     input_s <= "0001";
     wait for 1 ns;
     Monitor ("0001000");
   
   --This test should fail right here due to having the wrong output on monitor
     input_s <= "0010";
     wait for 1 ns;
     Monitor ("1000111"); --wrong output, it should be Monitor ("0100100")
     
     input_s <= "0011";
     wait for 1 ns;
     Monitor ("0000001");
        
     input_s <= "0100";
     wait for 1 ns;
     Monitor ("0001001");

     input_s <= "1111";
     wait for 1 ns;
     Monitor ("1111111");
     
    --End simulation
   wait;
end process;

end Behavioral;




