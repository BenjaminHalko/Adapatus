/// @desc	A joint between 2 elements
/// @param	{Id.Instance} elem1
/// @param	{Id.Instance} elem2
/// @param	{Id.PhysicsIndex} joint
function ApplyJoint(_elem1, _elem2, _joint) {
	var _elem1Index = array_length(_elem1.joints);
	var _elem2Index = array_length(_elem2.joints);
	array_push(_elem1.joints, new __Joint(_elem2, _elem2Index, _joint));
	array_push(_elem2.joints, new __Joint(_elem1, _elem1Index, _joint));
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
function __Joint(_boundElement, _boundElementIndex, _joint) constructor {
	boundElement = _boundElement;
	boundElementIndex = _boundElementIndex;
	joint = _joint;
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

function MassOfConnectedObjects(_objsSoFar) {
	var _mass = 0;
	for(var i = 0; i < array_length(joints); i++) {
		if (!array_contains(_objsSoFar, joints[i].boundElement)) {
			array_push(_objsSoFar, joints[i].boundElement);
			with(joints[i].boundElement) {
				_mass += phy_mass / density;
				_mass += MassOfConnectedObjects(_objsSoFar);
			}
		}
	}
	
	return _mass;
}