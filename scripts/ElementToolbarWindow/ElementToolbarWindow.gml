/// @desc	A window for the GUI
/// @param	{enum.ELEMENT} element
function ElementToolbarWindow(_element) {
	var _sprite = sprite_get_name(sToolbarElement) + string_repeat("Plus", _element % 3);
	return new __ElementToolbarWindow(_element, asset_get_index(_sprite));
}


/// @desc	The backend for the window thing
/// @param	{enum.ELEMENT} element
/// @param	{Asset.GMSprite} sprite
function __ElementToolbarWindow(_element, _sprite) : MenuButton(_sprite) constructor {
	var _elementInfo = global.elementConfigList[_element];
	__name = _elementInfo.name;
	__type = _element;
	__elementSprite = object_get_sprite(_elementInfo.object);
	var _sprWidth = sprite_get_width(__elementSprite);
	var _sprHeight = sprite_get_height(__elementSprite);
	var _sprXOffset = sprite_get_xoffset(__elementSprite);
	var _sprYOffset = sprite_get_yoffset(__elementSprite);
	__elementXOffset = round(_sprXOffset - _sprWidth / 2);
	__elementYOffset = round(_sprYOffset - _sprHeight / 2);
	
	var _minWidth = 56;
	__width = max(_sprWidth + 6, StringWidth(__name) + 6, _minWidth);
	__elementWidth = _sprWidth;
	
	__hoveredPercent = 0;
	__burstEffect = 0;
	__activePercent = 0;
	__previouslyHovered = false;
	__animateYScale = true;
	
	__textOffsetY = sprite_get_bbox_top(__sprite);
	
	// Offset BBox
	__bboxRight = 3;
	
	Animate = function() { 
		// Animate
		__hoveredPercent = ApproachEase(__hoveredPercent, __isHovered, 0.1, 0.8);
		if (abs(__hoveredPercent - __isHovered) < 0.005)
			__hoveredPercent = __isHovered;
		__burstEffect = ApproachEase(__burstEffect, 0, 0.1, 0.8);
		if (__animateYScale)
			__yScale = lerp(1, (__height + 9.8) / __height, __hoveredPercent) * __activePercent;
		
		// Burst
		if (__isHovered) {
			if (!__previouslyHovered) {
				__burstEffect = 1;
				__previouslyHovered = true;
			}
		} else {
			__previouslyHovered = false	
		}
	}
	
	/// @param	{bool} showElement
	/// @param	{real} quantity
	static DrawElement = function(_showElement, _quantity) {
		var _extraY = __height * (__yScale - 1);
		var _textOffset = -__yOffset + __textOffsetY - 5;
		
		DrawButton();
		ScribbleExt(__name).blend(c_white, __alpha).draw(__x - __xOffset + 4, __y + _textOffset - _extraY);
		
		var _x = __x - __xOffset + __width / 2 - __elementXOffset;
		var _y = __y + _textOffset + __elementYOffset + 28;
	
		if (_showElement) {
			draw_sprite_ext(__elementSprite, 0, _x + 2, _y + 2 - round(_extraY / 2 - sin(__burstEffect * pi) * 2), 1, 1, 0, c_black, __alpha);
			draw_sprite_ext(__elementSprite, 0, _x, _y - round(_extraY / 2  + sin(__burstEffect * pi) * 3), 1, 1, 0, c_white, __alpha);
		}
		
		if (!is_infinity(_quantity)) {
			var _text = ScribbleExt($"x{_quantity}").align(fa_center, fa_middle);
			var _textX = _x + max(8, __elementWidth / 2);
			var _textY = _y + 6 - __elementYOffset - round(_extraY / 4);
	
			_text.blend(c_black, __alpha).draw(_textX+1, _textY-1);
			_text.draw(_textX+1, _textY+1);
			_text.draw(_textX-1, _textY-1);
			_text.draw(_textX-1, _textY+1);
			_text.draw(_textX+1, _textY);
			_text.draw(_textX, _textY+1);
			_text.draw(_textX, _textY-1);
			_text.draw(_textX-1, _textY);
			_text.blend(c_white, __alpha).draw(_textX, _textY);
		}
	}
	
	Step = CheckIfHovered;
	Draw = DrawElement;
}