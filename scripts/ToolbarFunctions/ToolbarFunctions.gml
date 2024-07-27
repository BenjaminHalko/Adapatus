/// @desc	Updates the active elements
/// @param	{struct} elements
function UpdateUsableElements(_elements) {
	for(var i = 0; i < ELEMENT.MAX; i++)
		global.elementQuantity[$ i] = 0;
	with (oToolbar) {
		var _elementIDs = struct_get_names(_elements);
		array_sort(_elementIDs, function(_a, _b) {
			_a = array_get_index(global.elementSortList, real(_a));
			_b = array_get_index(global.elementSortList, real(_b));
			return _a - _b;
		})
		for (var i = 0; i < array_length(_elementIDs); i++) {
			var _id = real(_elementIDs[i]);
			AddUsableElement(_id);
			global.elementQuantity[$ _id] = _elements[$ _id];
		}
	}
}

/// @desc	Updates the active elements
/// @param	{enum.ELEMENT} element
function AddUsableElement(_element) {
	with (oToolbar) {
		var _index = 0;
		var _targetIndex = array_get_index(global.elementSortList, _element);
		for(var i = 0; i < array_length(usableElements); i++) {
			var _thisElement = usableElements[i].type;
			if (_thisElement == _element)
				return;
			if (array_get_index(global.elementSortList, _thisElement) > _targetIndex)
				break;
			_index++;
		}
		array_insert(usableElements, _index, new ElementToolbarWindow(_element, sToolbarElement));
	}
}

/// @desc	A window for the GUI
/// @param	{enum.ELEMENT} element
/// @param	{Asset.GMSprite} sprite
function ElementToolbarWindow(_element, _sprite) constructor {
	live_auto_call
	
	var _elementInfo = global.elementConfigList[_element];
	var _minWidth = 56;
	name = _elementInfo.name;
	type = _element;
	sprite = object_get_sprite(_elementInfo.object);
	
	windowSpriteWidth = sprite_get_width(_sprite);
	windowSpriteHeight = sprite_get_height(_sprite);
	windowSpriteOffsetX = sprite_get_xoffset(_sprite);
	windowSpriteOffsetY = sprite_get_yoffset(_sprite);

	windowSprite = asset_get_index(sprite_get_name(_sprite) + string_repeat("Plus", type % 3));
	
	
	
	var _sprWidth = sprite_get_width(sprite);
	var _sprHeight = sprite_get_height(sprite);
	var _sprXOffset = sprite_get_xoffset(sprite);
	var _sprYOffset = sprite_get_yoffset(sprite);
	spriteXOffset = round(_sprXOffset - _sprWidth / 2);
	spriteYOffset = round(_sprYOffset - _sprHeight / 2);
	width = max(_sprWidth + 6, StringWidth(name) + 6, _minWidth);
	height = windowSpriteHeight - 2;
	hoveredPercent = 0;
	burstEffect = 0;
	activePercent = real(_sprite != sToolbarElement);
	height -= 2 * (_sprite == sRewardElement);
	
	spriteWidth = _sprWidth;
	
	/// @param	{real} elemX
	/// @param	{real} elemY
	/// @param	{bool} isHovered
	/// @param	{real} quantity
	/// @param	{bool} [showElement]
	/// @param	{real} [alpha]
	static Draw = function(_elemX, _elemY, _isHovered, _quantity, _showElement=true, _alpha=1) {
		var _extraY = floor(9.8 * hoveredPercent - windowSpriteHeight * 2 * (1 - activePercent));
		draw_sprite_ext(windowSprite, _isHovered, _elemX, _elemY, width / (windowSpriteWidth-2), (height + _extraY) / (windowSpriteHeight-2), 0, c_white, _alpha);
		ScribbleExt(name).blend(c_white, _alpha).draw(_elemX - windowSpriteOffsetX + 4, _elemY - windowSpriteOffsetY - 1 - ceil(_extraY));
	
		var _x = _elemX + width / 2 + spriteXOffset - 2;
		var _y = _elemY - windowSpriteOffsetY + spriteYOffset + 27;
	
		if (_showElement) {
			draw_sprite_ext(sprite, 0, _x + 2, _y + 2 - round(_extraY - sin(burstEffect * pi) * 2), 1, 1, 0, c_black, _alpha);
			draw_sprite_ext(sprite, 0, _x, _y - round(_extraY + sin(burstEffect * pi) * 3), 1, 1, 0, c_white, _alpha);
		}
	
		if (!is_infinity(_quantity)) {
			var _text = ScribbleExt($"x{_quantity}").align(fa_center, fa_middle);
			var _textX = _x + max(8, spriteWidth / 2 - 2);
			var _textY = _y + 6 - spriteYOffset -  round(_extraY / 1.5);
	
			_text.blend(c_black, _alpha).draw(_textX+1, _textY-1);
			_text.draw(_textX+1, _textY+1);
			_text.draw(_textX-1, _textY-1);
			_text.draw(_textX-1, _textY+1);
			_text.draw(_textX+1, _textY);
			_text.draw(_textX, _textY+1);
			_text.draw(_textX, _textY-1);
			_text.draw(_textX-1, _textY);
			_text.blend(c_white, _alpha).draw(_textX, _textY);
		}
	}
}