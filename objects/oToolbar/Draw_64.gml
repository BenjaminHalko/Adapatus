/// @desc Draw Toolbar

EnableLive;



// Draw Toolbar
draw_sprite_ext(sToolbar, 0, 0, ResHeight, toolbarXScale, 1, 0, c_white, 1);

// Draw Element Windows
var _elemX = elementListXStart;
var _hoveredElemX = 0;
for (var i = 0; i < array_length(usableElements); i++) {
	var _info = usableElements[i];
	if (elementHovered == i)
		_hoveredElemX = _elemX;
	else
		_info.Draw(_elemX, ResHeight, false, global.elementQuantity[$ _info.type]);
		
	// Spacing
	if (i != array_length(usableElements)-1) {
		_elemX += round((_info.width - 3) * _info.activePercent);
	}
}

if (elementHovered != -1) {
	var _info = usableElements[elementHovered];
	_info.Draw(_hoveredElemX, ResHeight, true, global.elementQuantity[$ _info.type], global.gameState != GameState.EDITING_ELEMENT);
}
