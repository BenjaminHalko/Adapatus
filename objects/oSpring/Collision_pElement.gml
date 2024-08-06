/// @desc BOING!!!

var _force = 10;
var _dir = phy_rotation;


physics_apply_force(x, y, lengthdir_x(_force, _dir), lengthdir_y(_force, _dir));

image_speed = 1;