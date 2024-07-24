/// @desc Draw Toolbar

EnableLive;

/// @param	{real} elemX
/// @param	{struct.ElementToolbarWindow} info
/// @param	{bool} isHovered
function DrawToolbarElementWindow(_elemX, _info, _isHovered) {
	var _extraY = floor(9.8 * _info.hoveredPercent - toolbarBaseHeight * 2 * (1 - _info.activePercent));
	draw_sprite_ext(sToolbarElement, _isHovered, _elemX, ResHeight, _info.width / (toolbarBaseWidth+2), (toolbarBaseHeight + _extraY) / toolbarBaseHeight, 0, c_white, 1);
	ScribbleExt(_info.name).blend(c_white, 1).draw(_elemX + 2, ResHeight - toolbarBaseHeight - 3 - ceil(_extraY));
	
	var _x = _elemX + _info.width / 2 + _info.spriteXOffset - 2;
	var _y = ResHeight - 15 + _info.spriteYOffset;
	
	if (!_isHovered or elementInHand == noone) and (global.elementQuantity[$ _info.type] > 0) {
		draw_sprite_ext(_info.sprite, 0, _x + 2, _y + 2 - round(_extraY / 2 - sin(_info.burstEffect * pi) * 2), 1, 1, 0, c_black, 1);
		draw_sprite(_info.sprite, 0, _x, _y - round(_extraY / 2 + sin(_info.burstEffect * pi) * 3));
	}
	
	if (!global.inLevelEditor) {
		var _text = ScribbleExt($"x{global.elementQuantity[$ _info.type]}").align(fa_center, fa_middle);
		var _textX = _x + max(8, sprite_get_width(_info.sprite) / 2 - 2);
		var _textY = _y + 6 - _info.spriteYOffset -  round(_extraY / 4);
	
		_text.blend(c_black).draw(_textX+1, _textY-1);
		_text.draw(_textX+1, _textY+1);
		_text.draw(_textX-1, _textY-1);
		_text.draw(_textX-1, _textY+1);
		_text.draw(_textX+1, _textY);
		_text.draw(_textX, _textY+1);
		_text.draw(_textX, _textY-1);
		_text.draw(_textX-1, _textY);
		_text.blend(c_white).draw(_textX, _textY);
	}
	
	
}

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
		DrawToolbarElementWindow(_elemX, _info, false);
		
	// Spacing
	if (i != array_length(usableElements)-1) {
		_elemX += round((_info.width - 3) * _info.activePercent);
	}
}

if (elementHovered != -1) {
	var _info = usableElements[elementHovered];
	DrawToolbarElementWindow(_hoveredElemX, _info, true);
}
