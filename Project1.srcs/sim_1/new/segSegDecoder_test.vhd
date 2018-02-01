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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity segSegDecoder_test is
--  Port ( );
end segSegDecoder_test;

architecture Behavioral of segSegDecoder_test is

component sevenSegDecoder
--  Port ( );
    Port (
    input_s : in STD_LOGIC_VECTOR (3 downto 0);
    optLetter : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;

signal input_s : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal optLetter : STD_LOGIC_VECTOR (6 downto 0);

begin

uut: sevenSegDecoder port map(input_s => input_s, optLetter => optLetter);

stim_proc: process
begin
    wait for 100 ns;
       wait for 10 ns;
       input_s <= "0000";
       wait for 10 ns;
       input_s <= "0001";
       wait for 10ns;
       input_s <= "0010";
        wait for 10 ns;
        input_s <= "0011";
        wait for 10 ns;
        input_s <= "0100";
        wait for 10ns;
        input_s <= "1111";
       wait;
       end process;

end Behavioral;




