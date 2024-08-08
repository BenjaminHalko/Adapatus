/// @desc	Adds an element to the element list
/// @param	{struct.ELEMENT} type
/// @param	{real} x
/// @param	{real} y
/// @param	{real} rotation
/// @return	{Id.Instance}
function AddElement(_type, _x, _y, _rotation) {
	var _params = new ElementParams(_type, _x, _y, _rotation, !global.inLevelEditor);
	var _elementID = instance_create_layer(_x, _y, "Entities", global.elementConfigList[_type].object, {
		phy_active: false,
		phy_rotation: _rotation
	});
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