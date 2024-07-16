enum ELEMENT_STATE {
	MOVING,
	IN_HAND,
	PLACED
}

global.elementInHand = noone;

/// @desc Adds an element to the element list
/// @param {struct.ELEMENT} type
/// @param {real} x
/// @param {real} y
/// @param {real} rotation
function AddElement(_type, _x, _y, _rotation) {
	var _params = new ElementParams(_type, _x, _y, _rotation, true);
	with(instance_create_layer(_x, _y, "Entities", global.elementConfigList[_type].object)) {
		isUnlocked = true;
		phy_rotation = _rotation;
	}
	array_push(levelData.elements, _params);
}

/// @desc Edits an entry in the save data to match the element
/// @param {Id.Instance} id
function EditElement(_id) {
	with (_id) {
		var _params = levelData.elements[levelDataPos];
		_params.x = round(phy_position_x);
		_params.y = round(phy_position_y);
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

function ElementSetMoveable(_state) {
	live_auto_call
	
	if (fixture != -1) {
		physics_remove_fixture(id, fixture);
		physics_fixture_delete(fixture);
	}
	var _fix = physics_fixture_create();
	if (collisionMaskType == MASK.Circle)
		physics_fixture_set_circle_shape(_fix, sprite_width / 2);
	else if (collisionMaskType == MASK.Rectangle)
		physics_fixture_set_box_shape(_fix, sprite_width / 2, sprite_height / 2);
	if (_state == ELEMENT_STATE.MOVING)
		physics_fixture_set_density(_fix, density);
	else if (_state == ELEMENT_STATE.IN_HAND)
		physics_fixture_set_density(_fix, 0.1);
	else
		physics_fixture_set_density(_fix, 0);
	physics_fixture_set_restitution(_fix, resitiution);
	physics_fixture_set_linear_damping(_fix, linearDamping);
	physics_fixture_set_angular_damping(_fix, angularDamping);
	physics_fixture_set_collision_group(_fix, 1);
	fixture = physics_fixture_bind(_fix, id);
	physics_fixture_delete(_fix);
}