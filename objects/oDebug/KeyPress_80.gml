/// @desc Swap Color Palette

global.colorPalette += 1;
if (global.colorPalette > PALETTE.GREYSCALE)
	global.colorPalette = 0;