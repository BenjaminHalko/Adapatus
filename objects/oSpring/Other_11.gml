/// @desc 

EnableLive;

var _list = GetOverlappingElements(phy_position_x, phy_position_y);
for(var i = 0; i < array_length(_list); i++) {
	var _obj = _list[i];	
	if (_obj == id)
		continue;
	var _joint = physics_joint_weld_create(id, _obj, x, y, 0, 20, 0, false);
	ApplyJoint(id, _obj.id, _joint);
}
