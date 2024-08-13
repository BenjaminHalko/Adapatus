/// @desc BOING!!!

EnableLive;

if (other.object_index == oRope)
	exit;

for(var i = 0; i < array_length(joints); i++) {
	if (other.id == joints[i].boundElement)
		break;
}



with (other) {
	var _force = 10 * phy_mass;
	var _dir = -other.phy_rotation + 90;

	print(_force, phy_mass, density, phy_mass * density);
	
	phy_speed_x = 0;
	phy_speed_y = 0;
	physics_apply_impulse(x, y, lengthdir_x(_force, _dir),lengthdir_y(_force, _dir));
	
	
	
}

image_speed = 1;

