/// @desc BOING!!!

var _force = 100;
var _dir = phy_rotation + 90;


// physics_apply_force(x, y, lengthdir_x(_force, _dir), lengthdir_y(_force, _dir));

with (other) {
	physics_apply_impulse(x, y, lengthdir_x(_force, _dir),lengthdir_y(_force, _dir));
}

image_speed = 1;