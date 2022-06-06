library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.commonPak.all;

entity Pixel_On_Text2 is
	generic(
		displayText: string  := (others => NUL)
	);
	port (
		clk: in std_logic;
		positionX: in integer;
		positionY: in integer;
		horzCoord: in integer;
		vertCoord: in integer;
		
		pixel: out std_logic := '0'
	);

end Pixel_On_Text2;

architecture Behavioral of Pixel_On_Text2 is

	signal fontAddress: integer;
	-- A row of bit in a charactor, we check if our current (x,y) is 1 in char row
	signal charBitInRow: std_logic_vector(FONT_WIDTH-1 downto 0) := (others => '0');
	-- char in ASCII code
	signal charCode:integer := 0;
	-- the position(column) of a charactor in the given text
	signal charPosition:integer := 0;
	-- the bit position(column) in a charactor
	signal bitPosition:integer := 0;
begin
    -- (horzCoord - position.x): x positionin the top left of the whole text
    charPosition <= (horzCoord - positionX)/FONT_WIDTH + 1;
    bitPosition <= (horzCoord - positionX) mod FONT_WIDTH;
    charCode <= character'pos(displayText(charPosition));
    -- charCode*16: first row of the char
    fontAddress <= charCode*16+(vertCoord - positionY);


	FontRom: entity work.Font_Rom
	port map(
		clk => clk,
		addr => fontAddress,
		fontRow => charBitInRow
	);
	
	pixelOn: process(clk)
		variable inXRange: boolean := false;
		variable inYRange: boolean := false;
	begin
        if rising_edge(clk) then
            -- reset
            inXRange := false;
            inYRange := false;
            pixel <= '0';
            -- If current pixel is in the horizontal range of text
            if horzCoord >= positionX and horzCoord < positionX + (FONT_WIDTH * displayText'length) then
                inXRange := true;
            end if;
            
            -- If current pixel is in the vertical range of text
            if vertCoord >= positionY and vertCoord < positionY + FONT_HEIGHT then
                inYRange := true;
            end if;
            
            -- need to check if the pixel is on for text
            if inXRange and inYRange then
                -- FONT_WIDTH-bitPosition: we are reverting the charactor
                if charBitInRow(FONT_WIDTH-bitPosition) = '1' then
                    pixel <= '1';
                end if;					
            end if;
        
        end if;
	end process;

end Behavioral;