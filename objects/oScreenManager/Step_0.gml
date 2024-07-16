/// @desc Manage Screen

// Invert Screen Colors
paletteInvertAmount = ApproachEase(paletteInvertAmount, global.colorPaletteInvert, 0.1, 0.8);

// Create GUI Surface
if (!surface_exists(global.guiSurface))
	global.guiSurface = surface_create(ResWidth, ResHeight);