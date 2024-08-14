/// @desc	A joint between 2 elements
/// @param	{Id.Instance} elem1
/// @param	{Id.Instance} elem2
/// @param	{Id.PhysicsIndex} joint
/// @param	{bool} [isRope]
function ApplyJoint(_elem1, _elem2, _joint, _isRope=false) {
	var _elem1Index = array_length(_elem1.joints);
	var _elem2Index = array_length(_elem2.joints);
	array_push(_elem1.joints, new __Joint(_elem2, _elem2Index, _joint, _isRope));
	array_push(_elem2.joints, new __Joint(_elem1, _elem1Index, _joint, _isRope));
}

function JointBindWheel() {
	var _list = ds_list_create();
	var _num = instance_position_list(x, y, pElement, _list, false);
	for(var i = 0; i < _num; i++) {	
		var _obj = _list[| i];	
		if (_obj == id)
			continue;
		var _joint = physics_joint_revolute_create(id, _obj.id, x, y, 0, 0, false, 0, 0, false, false);
		ApplyJoint(id, _obj.id, _joint);
	}
	ds_list_destroy(_list);	
}

/// @desc	A joint between 2 elements
/// @param	{Id.Instance} otherElem
/// @param	{real} boundElementIndex
/// @param	{Id.PhysicsIndex} joint
function __Joint(_boundElement, _boundElementIndex, _joint, _isRope) constructor {
	boundElement = _boundElement;
	boundElementIndex = _boundElementIndex;
	joint = _joint;
	isRope = _isRope;
	isDeleted = false;
	
	static Destroy = function() {
		if (isDeleted)
			return;
		isDeleted = true;
		with(boundElement)
			joints[other.boundElementIndex].isDeleted = true;
		physics_joint_delete(joint);
	}
}

/// @param	{Id.Instance} id
function MassOfElement(_id) {
	with (_id) {
		if (is_infinity(density))
			return infinity;
		var _mass = __MassOfConnectedElements([id]);
		if (is_infinity(_mass))
			return infinity;
		return _mass + phy_mass * density;	
	}
}

/// @param	{array<Id.Instance>} objsSoFar
function __MassOfConnectedElements(_objsSoFar) {
	var _mass = 0;
	for(var i = 0; i < array_length(joints); i++) {
		if (!array_contains(_objsSoFar, joints[i].boundElement)) {
			array_push(_objsSoFar, joints[i].boundElement);
			with(joints[i].boundElement) {
				if (is_infinity(density))
					return infinity;
				
				_mass += phy_mass * density;
				var _newMass = __MassOfConnectedElements(_objsSoFar);
				
				if (is_infinity(_mass))
					return infinity;
					
				_mass += _newMass;
			}
		}
	}
	
	return _mass;
}

/// @param	{Id.Instance} id
function SetSpeedOfElement(_id, _speedX, _speedY) {
	with (_id) {
		phy_speed_x = _speedX;
		phy_speed_y = _speedY;
		return __SetSpeedOfConnectedElements([id], _speedX, _speedY);	
	}
}

function __SetSpeedOfConnectedElements(_objsSoFar, _speedX, _speedY) {
	for(var i = 0; i < array_length(joints); i++) {
		if (!array_contains(_objsSoFar, joints[i].boundElement)) {
			array_push(_objsSoFar, joints[i].boundElement);
			with(joints[i].boundElement) {
				phy_speed_x = _speedX;
				phy_speed_y = _speedY;
				__SetSpeedOfConnectedElements(_objsSoFar, _speedX, _speedY);
			}
		}
	}
}

function ObjectPartOfConnection(_id, _objectToCheck, _includeRope=true) {
	with (_id) {
		return __ObjectPartOfConnection([id], _objectToCheck, _includeRope);	
	}
}

function __ObjectPartOfConnection(_objsSoFar, _objectToCheck, _includeRope) {
	print(object_get_name(object_index));
	for(var i = 0; i < array_length(joints); i++) {
		if (!array_contains(_objsSoFar, joints[i].boundElement)) {
			array_push(_objsSoFar, joints[i].boundElement);
			if (joints[i].boundElement == _objectToCheck)
				return true;
				
			if (joints[i].isRope and !_includeRope)
				continue;

			with (joints[i].boundElement) {
				if (__ObjectPartOfConnection(_objsSoFar, _objectToCheck, _includeRope))
					return true;
			}
		}
	}
	
	return false;
}