/// @desc Pin to elements

var _list = GetOverlappingElements(phy_position_x, phy_position_y);
for(var i = 0; i < array_length(_list); i++) {
	var _obj = _list[i];	
	if (_obj == id)
		continue;
	var _joint = physics_joint_weld_create(id, _obj, phy_position_x, phy_position_y, degtorad(degtorad(phy_rotation)) - degtorad(degtorad(_obj.phy_rotation)), 0, 20, false);
	ApplyJoint(id, _obj, _joint);
}