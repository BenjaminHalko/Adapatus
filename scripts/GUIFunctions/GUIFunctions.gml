/// @desc	Updates the active elements
/// @param	{struct} elements
function UpdateUsableElements(_elements) {
	with (oToolbar) {
		usableElements = [];
		var _elementIDs = struct_get_names(_elements);
		array_sort(_elementIDs, function(_a, _b) {
			_a = array_get_index(global.elementSortList, real(_a));
			_b = array_get_index(global.elementSortList, real(_b));
			return _a - _b;
		})
		for (var i = 0; i < array_length(_elementIDs); i++) {
			var _id = real(_elementIDs[i]);
			array_push(usableElements, new ElementToolbarWindow(_id));
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
		array_insert(usableElements, _index, new ElementToolbarWindow(_element));
	}
}

/// @desc	A window for the GUI
/// @param	{enum.ELEMENT} element
/// @param	{real} quantity
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
	activePercent = 0;
}