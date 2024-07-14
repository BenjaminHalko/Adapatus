/// @desc Adds an element to the element list
/// @param {struct.ELEMENT} type
/// @param {real} x
/// @param {real} y
/// @param {real} rotation
function AddElement(_type, _x, _y, _rotation) {
	var _params = new ElementParams(_type, _x, _y, _rotation, true);
	instance_create_layer(_x, _y, "Entities", global.elementList[_type].object, {
		levelDataPos: array_length(levelData.elements),
		phy_rotation: _rotation
	});
	array_push(levelData.elements, _params);
}

/// @desc Edits an entry in the save data to match the element
/// @param {Id.Instance} id
function EditElement(_id) {
	with (_id) {
		var _params = levelData.elements[levelDataPos];
		_params.x = x;
		_params.y = y;
		_params.rotation = phy_rotation;
		_params.isUnlocked = isUnlocked;
	}
}

/// @desc Removes an element
/// @param {Id.Instance} id
function DeleteElement(_id) {
	with (pElement) {
		if (id == _id)
			continue;
		if (levelDataPos > _id.levelDataPos)
			levelDataPos--;
	}
	array_delete(levelData.elements, _id.levelDataPos, 1);
	instance_destroy(_id);
}