----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/23/2018 11:31:10 PM
-- Design Name: 
-- Module Name: 7seg_mux - Behavioral
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

entity sevenSegTop is
    Port ( 
           clk_100Mhz : in STD_LOGIC;
           clr : in STD_LOGIC;
		   btnc: in STD_LOGIC;
           --x : in STD_LOGIC_VECTOR (15 downto 0); --message array
           sevseg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0)
         );
end sevenSegTop;

architecture Behavioral of sevenSegTop is

component sevenSegDecoder 
    Port (
    input_s : in STD_LOGIC_VECTOR (3 downto 0);
    optLetter : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;

component counter
    Port ( clk : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;

component debouncer 
    Port ( btn : in STD_LOGIC;
           cclk : in STD_LOGIC;
           clr : in STD_LOGIC;
           outpt : out STD_LOGIC);
end component;

component sevenSegMux 
    Port ( --inputs : in STD_LOGIC_VECTOR ( 3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           letter : out STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;

--signal s: STD_LOGIC_VECTOR( 1 downto 0);
--signal x : STD_LOGIC_VECTOR (15 downto 0);
-- x (3 downto 0) <= "0111";
-- when "00" => letter <= x (3 downto 0); an <= "0111";
--signal y : STD_LOGIC_VECTOR (3 downto 0);

signal tempLetter: STD_LOGIC_VECTOR (3 downto 0);
signal tempReset : STD_LOGIC;
signal temp_contr : STD_LOGIC_VECTOR (3 downto 0); --was (1 downto 0)
signal temp_LEDCounter : STD_LOGIC_VECTOR (1 downto 0);
signal tempAn : STD_LOGIC_VECTOR (1 downto 0);

begin

--an <= "0000"; --activate all LED's

--process (s (5 downto 2))
--begin
--    case (s (5 downto 2)) is
--    when "0000" => y (3 downto 0) <= "0000";
--    when "0001" => y (3 downto 0) <= "0001";
--    when "0010" => y (3 downto 0) <= "0010";
--    when "0011" => y (3 downto 0) <= "0011";
--    when others => y (3 downto 0) <= "1111";
--    end case;
-- end process;

temp_LEDCounter <= temp_contr (3 downto 2);


                                --Instantiating components
----------------------------------------------------------------------------------------------
u1: sevenSegDecoder port map(input_s => tempLetter, optLetter => sevseg);
c1: counter port map (clk => clk_100Mhz, output => temp_contr);
d1: debouncer port map (btn => btnc, cclk => clk_100Mhz, clr => clr, outpt => tempReset);
m1: sevenSegMux port map (s => temp_LEDCounter, letter => tempLetter, an => an);


end Behavioral;
