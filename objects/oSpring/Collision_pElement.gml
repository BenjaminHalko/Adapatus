/// @desc BOING!!!

EnableLive;

if (other.object_index == oRope)
	exit;
	
if (ObjectPartOfConnection(id, other.id, false)) 
	exit;
	
var _dir = image_angle + 90;
	
var _densitySelf = MassOfElement(id);

var _densityOther = MassOfElement(other.id);

var _forceSelf = 50 * _densitySelf;
var _forceOther = 50 * _densityOther;

if (!is_infinity(_densityOther)) {
	with(other) {
		SetSpeedOfElement(id, 0, 0);
		physics_apply_impulse(x, y, lengthdir_x(_forceOther, _dir), lengthdir_y(_forceOther, _dir));
	}
}

if (!is_infinity(_densitySelf)) {
	SetSpeedOfElement(id, 0, 0);
	physics_apply_impulse(x, y, -lengthdir_x(_forceSelf, _dir), -lengthdir_y(_forceSelf, _dir));
}

image_speed = 1;