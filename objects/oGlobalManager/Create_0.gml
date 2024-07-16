/// @desc Setup Game

// Debug Objects
if (DebugMode) {
	// Create GMLive
	instance_create_layer(0, 0, layer, obj_gmlive);
	room_set_live(rLevel, true);
	live_blank_object = obj_blank_object;
	live_blank_room = rm_blank_room;
	
	// Create Debug
	instance_create_layer(0, 0, layer, oDebug);
}

// Create Managers
instance_create_layer(0, 0, layer, oScreenManager);

// Set Cursor
CreateCursors();
cursorPalette = global.colorPalette;
cursorInvert = global.colorPaletteInvert;
cursorSize = CursorSize;

// Go to the next room
room_goto_next();
