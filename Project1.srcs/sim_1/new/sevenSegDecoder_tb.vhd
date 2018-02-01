----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2018 09:01:56 PM
-- Design Name: 
-- Module Name: segSegDecoder_test - Behavioral
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

entity sevenSegDecoder_tb is
--  Port ( );
end sevenSegDecoder_tb;

architecture Behavioral of sevenSegDecoder_tb is

component sevenSegDecoder 
    Port (
    input_s : in STD_LOGIC_VECTOR (3 downto 0);
    optLetter : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;

signal input_s : STD_LOGIC_VECTOR (3 downto 0);
signal optLetter : STD_LOGIC_VECTOR (6 downto 0);

Procedure Monitor (Shouldbe: in std_logic_vector) is
Variable lout: line;

begin
WRITE (lout, NOW, right, 10, ns);
WRITE (lout, string'(" input_s --> "));
WRITE (lout, input_s);
WRITE (lout, string'(" optLetter --> "));
WRITE (lout, optLetter);
WRITELINE(OUTPUT, lout);

Assert optLetter = Shouldbe REPORT "Test failed" SEVERITY FAILURE;

end Monitor;

begin

uut: sevenSegDecoder port map(input_s => input_s, optLetter => optLetter);

stim_proc: process
begin
    wait for 100 ns;
    Report "Beginning Seven Segment Decoder test" SEVERITY NOTE;
    
     input_s <= "0000";
     wait for 1 ns;
     Monitor ("1000111");
     
     input_s <= "0001";
     wait for 1 ns;
     Monitor ("0001000");
      
     input_s <= "0010";
     wait for 1 ns;
     Monitor ("1000111");
     --Monitor ("0100100");
     
     input_s <= "0011";
     wait for 1 ns;
     Monitor ("0000001");
        
     input_s <= "0100";
     wait for 1 ns;
     Monitor ("0001001");

     input_s <= "1111";
     wait for 1 ns;
     Monitor ("1111111");
     
     
   wait;
end process;

end Behavioral;




