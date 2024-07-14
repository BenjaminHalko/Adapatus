/// @desc Manage Screen

// Invert Screen Colors
paletteInvertAmount = ApproachEase(paletteInvertAmount, global.colorPaletteInvert, 0.1, 0.8);

// Change Cursor Colors
var _cursorSize = max(min(window_get_width()/ResWidth,window_get_height()/ResHeight),1);
if (cursorPalette != global.colorPalette or cursorInvert != global.colorPaletteInvert or cursorSize != _cursorSize) {
	cursorPalette = global.colorPalette;
	cursorInvert = global.colorPaletteInvert;
	cursorSize = _cursorSize;
	DestroyCursors();
	CreateCursors();
}

// Create GUI Surface
if (!surface_exists(global.guiSurface))
	global.guiSurface = surface_create(ResWidth, ResHeight);