/// @desc Switch Palette

global.colorPalette++;
if (global.colorPalette > PALETTE.GREYSCALE)
	global.colorPalette = 0;