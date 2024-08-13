/// @desc Bind Balls

var _list = GetOverlappingElements(phy_position_x, phy_position_y);
for(var i = 0; i < array_length(_list); i++) {
	var _obj = _list[i];	
	if (_obj == id)
		continue;
	var _joint = physics_joint_revolute_create(id, _obj.id, x, y, 0, 0, false, 0, 0, false, false);
	ApplyJoint(id, _obj.id, _joint);
}
