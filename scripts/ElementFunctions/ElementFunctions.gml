/// @desc	Adds an element to the element list
/// @param	{struct.ELEMENT} type
/// @param	{real} x
/// @param	{real} y
/// @param	{real} rotation
/// @return	{Id.Instance}
function AddElement(_type, _x, _y, _rotation) {
	var _params = new ElementParams({
		type: _type,
		x: _x,
		y: _y,
		rotation: _rotation
	}, !global.inLevelEditor);
	var _vars = {
		phy_active: false,
		phy_rotation: _rotation
	};
	var _elementID = instance_create_layer(_x, _y, "Entities", global.elementConfigList[_type].object, _vars);
	with(_elementID) {
		isUnlocked = _params.isUnlocked;
	}
	array_push(global.placedElements, _params);
	CollectAllSnaps();
	return _elementID;
}

/// @desc	Edits an entry in the save data to match the element
/// @param	{Id.Instance} id
function EditElement(_id) {
	if (global.gameState == GameState.SIMULATION)
		show_error("Cannot edit while active", true);
	with (_id) {
		var _params = global.placedElements[levelDataPos];
		_params.x = round(phy_position_x);
		_params.y = round(phy_position_y);
		_params.rotation = round(phy_rotation);
		_params.isUnlocked = isUnlocked;
		var _extraData = global.elementConfigList[_params.type].extraData;
		if (!is_undefined(_extraData)) {
			for (var i = 0; i < array_length(_extraData); i++) {
				_params[$ _extraData[i]] = variable_instance_get(id, _extraData[i]);
			}
		}
	}
}

/// @desc	Removes an element
/// @param	{Id.Instance} id
function DeleteElement(_id) {
	with (pElement) {
		if (id == _id)
			continue;
		if (levelDataPos > _id.levelDataPos)
			levelDataPos--;
	}
	var _type = global.placedElements[_id.levelDataPos].type;
	global.elementQuantity[$ _type]++;
	AddUsableElement(_type);
	array_delete(global.placedElements, _id.levelDataPos, 1);
	_id.levelDataPos = -1;
	instance_destroy(_id);
	CollectAllSnaps();
}

/// @desc	Sorts a list of elements
/// @param	{array<struct.ElementParams>}
function SortElementArray(_elements) {
	// TODO: Sort better
	
	array_sort(_elements, function(_a, _b) {
		var _prioritySort = (_a.priority - _b.priority);
		return _prioritySort;
	});
}

/// @desc	Selects a random level data pos of an element type
/// @param	{Asset.GMObject} element
/// @retrun	{real}
function SelectRandomElement(_element) {
	var _possiblePositions = [];
	for(var i = 0; i < array_length(global.placedElements); i++) {
		if (global.placedElements[i].type == _element)
			array_push(_possiblePositions, i);
	}
	var _numPositions = array_length(_possiblePositions);
	return _possiblePositions[irandom(_numPositions - 1)];
}

/// @desc	Gets the id of an element object based on level data pos
/// @param	{real} levelDataPos
/// @return	{Id.Instance}
function GetElementID(_levelDataPos) {
	with(pElement) {
		if (_levelDataPos == levelDataPos)
			return id;
	}
	
	return noone;
}

/// @desc	Gets a list of elements overlapping a point
/// @param	{real} x
/// @param	{real} y
/// @return	{array<Any*>}
function GetOverlappingElements(_x, _y) {
	var _list = ds_list_create();
	var _num = collision_rectangle_list(_x-1, _y-1, _x+1, _y+1, pElement, true, true, _list, true);
	var _array = array_create(_num);
	for(var i = 0; i < _num; i++)
		_array[i] = _list[| i];
	ds_list_destroy(_list);
	return _array;
}