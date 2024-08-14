/// @desc Draw Shadow

EnableLive;

if (!global.drawPhysicsDebug) {
	draw_sprite_ext(sprite_index, image_index, x + 2, y + 2, image_xscale, image_yscale, image_angle, c_black, image_alpha);
}
