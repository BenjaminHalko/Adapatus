enum PALETTE {
	GAMEBOY,
	REDISH_ORANGE,
	BLUE,
	GREYSCALE // MAKE SURE THIS IS LAST, OR ELSE DEBUGGING WILL BREAK
}

global.colorPalette = PALETTE.GAMEBOY;
global.colorPaletteInvert = false;
global.colorPaletteColors = {};

global.colorPaletteColors[PALETTE.GAMEBOY] =
	PaletteToArray(#081820, #346856, #88c070, #e0f8d0);

global.colorPaletteColors[PALETTE.REDISH_ORANGE] =
	PaletteToArray(#7F4C56, #e5989b, #ffb4a2, #ffcdb2);
	
global.colorPaletteColors[PALETTE.BLUE] =
	PaletteToArray(#03045e, #0077b6, #00b4d8, #90e0ef);
	
global.colorPaletteColors[PALETTE.GREYSCALE] =
	PaletteToArray(#463f3a, #8a817c, #bcb8b1, #f4f3ee);
	