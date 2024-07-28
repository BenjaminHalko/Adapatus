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
			var _thisElement = usableElements[i].__type;
			if (_thisElement == _element)
				return;
			if (array_get_index(global.elementSortList, _thisElement) > _targetIndex)
				break;
			_index++;
		}
		array_insert(usableElements, _index, ElementToolbarWindow(_element));
	}
}