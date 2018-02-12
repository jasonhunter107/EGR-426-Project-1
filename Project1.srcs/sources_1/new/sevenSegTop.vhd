----------------------------------------------------------------------------------
-- Company: GVSU
-- Engineer: Jason Hunter
-- 
-- Create Date: 01/23/2018 11:31:10 PM
-- Design Name: Scrolling Marquee
-- Module Name: sevenSegTop
-- Project Name: EGR-426-Project-1
-- Target Devices: Artix 7
-- Description: Top level of the design, this connects all the components for the
--              scrolling marquee design.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSegTop is
    Port ( 
           clk_100Mhz : in STD_LOGIC; --Clock from board
           clr : in STD_LOGIC; --clr switch (never used)
		   btnc: in STD_LOGIC; --center button on board
           sevseg : out STD_LOGIC_VECTOR (6 downto 0); --seven segment pattern for each letter
           an : out STD_LOGIC_VECTOR (3 downto 0); --an signal
           dp : out STD_LOGIC --dp signal
         );
end sevenSegTop;

architecture Behavioral of sevenSegTop is

--Seven segement LED decoder
component sevenSegDecoder 
    Port (
    input_s : in STD_LOGIC_VECTOR (3 downto 0);
    optLetter : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;

--2 bit counter
component counter
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (1 downto 0)
           );
end component;

--Debouncer for button
component debouncer 
    Port ( btn : in STD_LOGIC;
           cclk : in STD_LOGIC;
           clr : in STD_LOGIC;
           outpt : out STD_LOGIC);
end component;

--Multiplexer for Seven segment display
component sevenSegMux 
    Port ( inputs : in STD_LOGIC_VECTOR ( 15 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           letter : out STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           dp : out STD_LOGIC
           );
end component;

--50 MHz clock divider
component fiftyMHzClkDivider 
    Port ( clk : in STD_LOGIC;
           output : out STD_LOGIC
           );
end component;

--Component that holds name and outputs it through mux
component msgArray
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           msgOutput : out STD_LOGIC_VECTOR (15 downto 0)
           );
end component;

signal tempInput : STD_LOGIC_VECTOR (15 downto 0); --Letters in name
signal tempLetter: STD_LOGIC_VECTOR (3 downto 0); --Individual letter for name going through decoder
signal tempReset : STD_LOGIC; --determines if button is pressed
signal temp_contr : STD_LOGIC_VECTOR (1 downto 0); --output of 2-bit counter
signal temp_LEDCounter : STD_LOGIC_VECTOR (1 downto 0); --For switching and displaying letter between LED in MUX
signal tempAn : STD_LOGIC_VECTOR (1 downto 0); --AN signal thats outputted through MUX
signal tempDivider : STD_LOGIC; --Output of the 50MHz divider

begin

                                --Instantiating components
----------------------------------------------------------------------------------------------
u1: sevenSegDecoder port map(input_s => tempLetter, optLetter => sevseg);
c1: counter port map (clk => clk_100Mhz, reset => clr, output => temp_contr);
d1: debouncer port map (btn => btnc, cclk => clk_100Mhz, clr => clr, outpt => tempReset);
m1: sevenSegMux port map (inputs => tempInput ,s => temp_contr, letter => tempLetter, an => an, dp => dp);
cd1: fiftyMHzClkDivider port map (clk => clk_100Mhz, output => tempDivider);
ma1: msgArray port map (clk => tempDivider, btn => tempReset, msgOutput => tempInput);

end Behavioral;
