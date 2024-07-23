/// @desc Edit

// Inherit the parent event
event_inherited();

if (bindPercent != 0 and global.elementInteracting == id)
	draw_sprite_ext(sprite_index, 1, x, y, image_xscale * bindPercent, image_yscale * bindPercent, image_angle, image_blend, image_alpha);