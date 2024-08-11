/// @desc Change Cursor Colors + Transition

var _cursorSize = CursorSize;
if (cursorPalette != global.colorPalette or cursorSize != _cursorSize) {
	cursorPalette = global.colorPalette;
	cursorSize = _cursorSize;
	DestroyCursors();
	CreateCursors();
}