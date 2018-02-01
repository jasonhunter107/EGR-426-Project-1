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

entity sevenSeg_Mux is
    Port ( 
           clk_100Mhz : in STD_LOGIC;
           clr : in STD_LOGIC;
		   --s: in STD_LOGIC_VECTOR( 5 downto 0); --6 switches
		   btnc: in STD_LOGIC;
           --x : in STD_LOGIC_VECTOR (15 downto 0); --message array
           sevseg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0)
         );
end sevenSeg_Mux;

architecture Behavioral of sevenSeg_Mux is

component sevenSegDecoder 
    Port (
    input_s : in STD_LOGIC_VECTOR (3 downto 0);
    optLetter : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;

component halfSecCounter
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (1 downto 0)
           );
end component;

component debouncer 
    Port ( btn : in STD_LOGIC;
           cclk : in STD_LOGIC;
           clr : in STD_LOGIC;
           outpt : out STD_LOGIC);
end component;

--signal s: STD_LOGIC_VECTOR( 1 downto 0);
--signal x : STD_LOGIC_VECTOR (15 downto 0);
-- x (3 downto 0) <= "0111";
-- when "00" => letter <= x (3 downto 0); an <= "0111";
--signal y : STD_LOGIC_VECTOR (3 downto 0);

signal letter: STD_LOGIC_VECTOR (3 downto 0);
signal tempReset : STD_LOGIC;
signal temp_contr : STD_LOGIC_VECTOR (1 downto 0);
signal temp_LEDCounter : STD_LOGIC_VECTOR (1 downto 0);

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

temp_LEDCounter <= temp_contr (1 downto 0);

--4 to 1 mux
process (temp_LEDCounter)
begin
    case temp_LEDCounter is
    when "00" => letter <= "0000"; an <= "0111";
    when "01" => letter <= "0001"; an <= "1011";
    when "10" => letter <= "0010"; an <= "1101";
    when others => letter <= "0011"; an <= "1110";
    end case;
end process;

u1: sevenSegDecoder port map(input_s => letter, optLetter => sevseg);
c1: halfSecCounter port map (clk => clk_100Mhz, reset => clr, output => temp_contr);
d1: debouncer port map (btn => btnc, cclk => clk_100Mhz, clr => clr, outpt => tempReset);


end Behavioral;
