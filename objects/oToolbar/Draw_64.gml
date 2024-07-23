/// @desc Draw Toolbar

EnableLive;

/// @param	{real} elemX
/// @param	{struct.ElementToolbarWindow} info
/// @param	{bool} isHovered
function DrawToolbarElementWindow(_elemX, _info, _isHovered) {
	var _extraY = floor(10 * _info.hoveredPercent);
	draw_sprite_ext(_isHovered ? sToolbarElementHovered : sToolbarElement, 0, _elemX, ResHeight, _info.width / toolbarBaseWidth, (toolbarBaseHeight + _extraY) / toolbarBaseHeight, 0, c_white, 1);
	ScribbleExt(_info.name).blend(c_white, 1).draw(_elemX + 3, ResHeight - toolbarBaseHeight - 3 - ceil(_extraY));
	
	if (!_isHovered or elementInHand == noone) {
		var _x = _elemX + _info.width / 2 + _info.spriteXOffset;
		var _y = ResHeight - 15 + _info.spriteYOffset;
		draw_sprite_ext(_info.sprite, 0, _x + 2, _y + 2 - round(_extraY / 2 - sin(_info.burstEffect * pi) * 2), 1, 1, 0, c_black, 1);
		draw_sprite(_info.sprite, 0, _x, _y - round(_extraY / 2 + sin(_info.burstEffect * pi) * 3));
	}
}

// Draw Toolbar
draw_sprite_ext(sToolbar, 0, 0, ResHeight, toolbarXScale, 1, 0, c_white, 1);

// Draw Element Windows
var _elemX = elementListXStart;
var _hoveredElemX = 0;
for (var i = 0; i < array_length(usableElements); i++) {
	var _info = usableElements[i];
	if (elementHovered == i) {
		_hoveredElemX = _elemX;
		_elemX += _info.width - 2;
		continue;
	}
	DrawToolbarElementWindow(_elemX, _info, false);
	_elemX += _info.width - 2;
}

if (elementHovered != -1) {
	var _info = usableElements[elementHovered];
	DrawToolbarElementWindow(_hoveredElemX, _info, true);
}
