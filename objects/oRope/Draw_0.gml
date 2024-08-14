/// @desc Draw Shadow

var _xscale = 1;

var _object = joints[0].boundElement;
if (instance_exists(_object) and !broken) {
	_xscale = point_distance(x,y,_object.x, _object.y) / 2;	
}

draw_sprite_ext(sprite_index, image_index, x+2, y+2, _xscale, 1, image_angle, c_black, image_alpha);