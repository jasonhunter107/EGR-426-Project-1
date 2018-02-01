----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2018 02:07:30 AM
-- Design Name: 
-- Module Name: sevenSegMux_tb - Behavioral
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

entity sevenSegMux_tb is
--  Port ( );
end sevenSegMux_tb;

architecture Behavioral of sevenSegMux_tb is

component sevenSegMux 
    Port ( --inputs : in STD_LOGIC_VECTOR ( 3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           letter : out STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;

signal s : STD_LOGIC_VECTOR (1 downto 0);
signal letter, an : STD_LOGIC_VECTOR (3 downto 0);

Procedure Monitor (Shouldbe: in STD_LOGIC_VECTOR (3 downto 0);
                     Shouldbe1: in STD_LOGIC_VECTOR (3 downto 0)) is
Variable lout: line;

begin
WRITE(lout, now, right, 10, ns);
WRITE(lout, string'(" s --> "));
WRITE(lout, s);
WRITE(lout, string'(" letter --> "));
WRITE(lout, letter);
WRITE(lout, string'(" an --> "));
WRITE(lout, an);
WRITELINE(OUTPUT, lout);

Assert letter = Shouldbe Report "Test failed" SEVERITY FAILURE;
Assert an = Shouldbe1 Report "Test failed" SEVERITY FAILURE;

end Monitor;


begin
M1: sevenSegMux port map (s => s, letter => letter, an => an);

stim_proc: process
begin

wait for 100 ns;

--Report "Beginning MUX test" SEVERITY NOTE;

    s <= "00";
    wait for 1 ns;
    Monitor("0000","0111");
--    Assert letter = "0000" REPORT "Failed Test 1" SEVERITY FAILURE;
--    Assert an = "0111" REPORT "Failed Test 1" SEVERITY FAILURE;
    
    s <= "01";
    wait for 1 ns;
    Monitor("0001","1011");
--    Assert letter = "0001" REPORT "Failed Test 2" SEVERITY FAILURE;
--    Assert an = "1011" REPORT "Failed Test 2" SEVERITY FAILURE;
    
    s <= "10";
    wait for 1 ns;
    Monitor("1111","1111"); --should be ("0010","1101");
--    Assert letter = "0010" REPORT "Failed Test 3" SEVERITY FAILURE;
--    Assert an = "1101" REPORT "Failed Test 3" SEVERITY FAILURE; --an = 1101
    
    s <= "11";
    wait for 1 ns;
    Monitor("0011","1110");
--    Assert letter = "0011" REPORT "Failed Test 4" SEVERITY FAILURE;
--    Assert an = "1110" REPORT "Failed Test 4" SEVERITY FAILURE;
    
    wait;
    
 end process;
    


end Behavioral;
