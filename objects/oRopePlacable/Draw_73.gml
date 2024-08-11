/// @desc Draw Long Self

if (global.elementInteracting != id) {
	event_inherited();
	return;
}

if (is_undefined(x2))
	exit;

var _dist = point_distance(x, y, x2, y2);
var _dir = point_direction(x, y, x2, y2);

var _yscale = 1;
if (_dir >= 135 and _dir < 305)
	_yscale *= -1;

draw_sprite_ext(sRope, 0, x, y, _dist / 2, _yscale, _dir, c_white, 1);
