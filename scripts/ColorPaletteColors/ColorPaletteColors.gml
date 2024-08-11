enum PALETTE {
	GAMEBOY,
	REDISH_ORANGE,
	BLUE,
	PURPLE,
	SUNSET,
	WOOD,
	BEACH,
	FRUIT,
	RED_BLACK,
	HC_ORANGE,
	HC_BLUE,
	GREYSCALE // MAKE SURE THIS IS LAST, OR ELSE DEBUGGING WILL BREAK
}

global.colorPalette = PALETTE.BEACH;
global.colorPaletteColors = {};

global.colorPaletteColors[PALETTE.GAMEBOY] =
	PaletteToArray(#081820, #346856, #88c070, #e0f8d0);

global.colorPaletteColors[PALETTE.REDISH_ORANGE] =
	PaletteToArray(#7F4C56, #e5989b, #ffb4a2, #ffcdb2);
	
global.colorPaletteColors[PALETTE.BLUE] =
	PaletteToArray(#03045e, #0077b6, #00b4d8, #90e0ef);
	
global.colorPaletteColors[PALETTE.PURPLE] =
	PaletteToArray(#230c33, #592e83, #9984d4, #caa8f5);
	
global.colorPaletteColors[PALETTE.SUNSET] =
	PaletteToArray(#355070, #6d597a, #b56576, #e56b6f);
	
global.colorPaletteColors[PALETTE.WOOD] =
	PaletteToArray(#1B1A17, #533E2D, #9D5C63, #F1D1B5);
	
global.colorPaletteColors[PALETTE.BEACH] =
	PaletteToArray(#0B1E2D, #264653, #2A9D8F, #E9C46A);
	
global.colorPaletteColors[PALETTE.FRUIT] =
	PaletteToArray(#1D2B53, #7D2437, #FF002F, #FFEC27);	

global.colorPaletteColors[PALETTE.RED_BLACK] =
	PaletteToArray(#1A1A1A, #555555, #D32F2F, #E0E0E0);
	
global.colorPaletteColors[PALETTE.HC_ORANGE] =
	PaletteToArray(#000000, #2B2B2B, #FFAA00, #FFFFFF);		

global.colorPaletteColors[PALETTE.HC_BLUE] =
	PaletteToArray(#000000, #404040, #0184FF, #00FFFF);		
	
global.colorPaletteColors[PALETTE.GREYSCALE] =
	PaletteToArray(#463f3a, #8a817c, #bcb8b1, #f4f3ee);
	