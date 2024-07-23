/// @desc Change Cursor Colors

var _cursorSize = CursorSize;
if (cursorPalette != global.colorPalette or cursorInvert != global.colorPaletteInvert or cursorSize != _cursorSize) {
	cursorPalette = global.colorPalette;
	cursorInvert = global.colorPaletteInvert;
	cursorSize = _cursorSize;
	DestroyCursors();
	CreateCursors();
}

if (!global.hasNativeCursor) {
	if (MouseInWindow()) {
		if (cursor_sprite == -1)
			cursor_sprite = global.cursors[global.currentCursorType];
	} else {
		cursor_sprite = -1;	
	}
}