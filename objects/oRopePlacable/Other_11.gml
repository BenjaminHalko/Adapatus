/// @desc Create rope objects

var _dir = 0;
var _len = 500;

var _previous = noone;
for(var i = 0; i < _len; i += 1) {
	var _rope = instance_create_depth(
		x + lengthdir_x(i, _dir),
		y + lengthdir_y(i, _dir),
		depth,
		oRope
	);
	
	if (instance_exists(_previous)) {
		var _joint = physics_joint_distance_create(_previous, _rope, _previous.x, _previous.y, _rope.x, _rope.y, false);
		physics_joint_set_value(_joint, phy_joint_damping_ratio, 0);
		physics_joint_set_value(_joint, phy_joint_frequency, 20);
	}
	
	_previous = _rope;
}

instance_destroy();
