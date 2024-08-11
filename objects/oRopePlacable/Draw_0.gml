/// @desc Draw Shadow

if (global.elementInteracting == id) {
	draw_sprite_ext(sprite_index, image_index, x + 2, y + 2, 1, 1, 0, c_black, 1);
}

if (is_undefined(x2))
	exit;

var _dist = point_distance(x, y, x2, y2);
var _dir = point_direction(x, y, x2, y2);

draw_sprite_ext(sRope, 0, x + 2, y + 2, _dist / 2, 1, _dir, c_black, 1);
