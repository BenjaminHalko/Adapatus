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
instance_create_layer(0, 0, layer, oCamera);

// Set Cursor
CreateCursors();
cursorPalette = global.colorPalette;
cursorSize = CursorSize;

// Initializes Scribble
ScribbleConfig();

// Debug
global.frameNumber = 0;

// Go to the next room
room_goto_next();
