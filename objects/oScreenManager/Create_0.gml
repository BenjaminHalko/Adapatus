/// @desc Setup Resolution

// Resolution
surface_resize(application_surface, ResWidth, ResHeight);
window_set_size(ResWidth * 4, ResHeight * 4);
window_center();

// Surface
application_surface_draw_enable(false);
global.shadowSurface = surface_create(ResWidth, ResHeight);

// Color Palette
global.colorPalette = PALETTE.GAMEBOY;
global.colorPaletteInvert = false;
paletteInvertAmount = 0;

// Set Cursor
CreateCursors();
cursorPalette = global.colorPalette;
cursorInvert = global.colorPaletteInvert;
cursorSize = max(min(window_get_width()/ResWidth,window_get_height()/ResHeight),1);
