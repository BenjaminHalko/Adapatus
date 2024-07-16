enum CURSOR {
	NORMAL
}
global.currentCursorType = CURSOR.NORMAL;
global.cursors = [];
global.hasNativeCursor = (os_type == os_windows or os_browser != browser_not_a_browser);
global.cursorSprites = [
	sCursor
];

function native_cursor(_ptr) constructor {
	__ptr__ = _ptr;
}

/// @param	{struct.CURSOR} type
function SetCursor(_type) {
	if (global.currentCursorType != _type) {
		global.currentCursorType = _type;
		if (global.hasNativeCursor) native_cursor_set(global.cursors[_type]);
		else cursor_sprite = global.cursors[_type];
	}
}

function DestroyCursors() {
	if (global.hasNativeCursor) {
		native_cursor_reset();
		for(var i = 0; i < array_length(global.cursors); i++) {
			native_cursor_destroy(global.cursors[i]);	
		}
	} else {
		cursor_sprite = -1;
		for(var i = 0; i < array_length(global.cursors); i++) {
			sprite_delete(global.cursors[i]);
		}
	}
	global.cursors = [];
}

function CreateCursors() {
	var _numCursors = array_length(global.cursorSprites);
	if (array_length(global.cursors) != _numCursors) global.cursors = array_create(_numCursors);

	var _size = CursorSize;
	for(var i = 0; i < _numCursors; i++) {
		var _spriteWidth = ceil(sprite_get_width(global.cursorSprites[i])*_size);
		var _spriteHeight = ceil(sprite_get_height(global.cursorSprites[i])*_size);
		var _spriteXOffset = round(sprite_get_xoffset(global.cursorSprites[i])*_size);
		var _spriteYOffset = round(sprite_get_yoffset(global.cursorSprites[i])*_size);
		var _surf = surface_create(_spriteWidth,_spriteHeight);
		surface_set_target(_surf);
		shader_set(shColorPalette);
		shader_set_uniform_f_array(global.uColorPaletteColors, global.colorPaletteColors[global.colorPalette]);
		shader_set_uniform_f(global.uColorPaletteInvert, global.colorPaletteInvert);
		draw_sprite_ext(global.cursorSprites[i],0,_spriteXOffset,_spriteYOffset,_size,_size,0,c_white,1);
		shader_reset();
		surface_reset_target();

		if (global.hasNativeCursor) {
			global.cursors[i] = native_cursor_create_from_surface(_surf,_spriteXOffset,_spriteYOffset);
		} else {
			global.cursors[i] = sprite_create_from_surface(_surf,0,0,_spriteWidth,_spriteHeight,false,false,_spriteXOffset,_spriteYOffset)
		}
		
		surface_free(_surf);
	}
	
	var _type = global.currentCursorType;
	global.currentCursorType = -1;
	SetCursor(_type);
}