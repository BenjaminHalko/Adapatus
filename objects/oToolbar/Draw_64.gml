/// @desc Draw Toolbar

EnableLive;

// Draw Toolbar
draw_sprite_ext(sToolbar, 0, 0, ResHeight, toolbarXScale, 1, 0, c_white, 1);

// Draw Element Windows
for (var i = 0; i < array_length(usableElements); i++) {
	var _info = usableElements[i];
	if (elementHovered != i)
		_info.DrawElement(true, global.elementQuantity[$ _info.__type]);
}

if (elementHovered != -1) {
	var _info = usableElements[elementHovered];
	_info.DrawElement(global.gameState != GameState.EDITING_ELEMENT, global.elementQuantity[$ _info.__type]);
}
