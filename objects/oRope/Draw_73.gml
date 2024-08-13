/// @desc Draw Self

var _yscale = image_yscale;
var _angle = Wrap(image_angle, 0, 360);

if (_angle >= 135 and _angle < 305)
	_yscale *= -1;
	
var _xscale = 1;

var _object = joints[0].boundElement;
if (instance_exists(_object)) {
	_xscale = point_distance(x,y,_object.x, _object.y) / 2;	
}

draw_sprite_ext(sprite_index, image_index, x, y, _xscale, _yscale, image_angle, image_blend, image_alpha);