/// @desc	Updates the active elements
/// @param	{array<enum.ELEMENT>} elements
function UpdateUsableElements(_elements) {
	with (oToolbar) {
		usableElements = [];
		for (var i = 0; i < array_length(_elements); i++)
			array_push(usableElements, new ElementToolbarWindow(_elements[i]));
	}
}

/// @desc	A window for the GUI
/// @param	{enum.ELEMENT} element
function ElementToolbarWindow(_element) constructor {
	var _elementInfo = global.elementConfigList[_element];
	var _minWidth = 56;
	name = _elementInfo.name;
	type = _element;
	sprite = object_get_sprite(_elementInfo.object);
	var _sprWidth = sprite_get_width(sprite);
	var _sprHeight = sprite_get_height(sprite);
	var _sprXOffset = sprite_get_xoffset(sprite);
	var _sprYOffset = sprite_get_yoffset(sprite);
	spriteXOffset = round(_sprXOffset - _sprWidth / 2);
	spriteYOffset = round(_sprYOffset - _sprHeight / 2);
	width = max(_sprWidth + 6, StringWidth(name) + 6, _minWidth);
	hoveredPercent = 0;
	burstEffect = 0;
}