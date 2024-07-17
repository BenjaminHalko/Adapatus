/// @desc Bind Balls

EnableLive;

var _list = ds_list_create();
var _num = instance_position_list(phy_position_x, phy_position_y, pElement, _list, true);
for(var i = 0; i < _num; i++) {
	var _obj = _list[| i];	
	if (_obj == id)
		continue;
	physics_joint_revolute_create(id, _obj.id, phy_position_x, phy_position_y, 0, 0, false, 100, -50, true, false);
}
ds_list_destroy(_list);
