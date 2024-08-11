/// @desc Draw Self

var _yscale = image_yscale;
var _angle = Wrap(image_angle, 0, 360);

if (_angle >= 135 and _angle < 305)
	_yscale *= -1;

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, _yscale, image_angle, image_blend, image_alpha);