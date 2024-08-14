/// @desc Draw While Dragging

EnableLive;

if (global.elementInteracting == id) {
	var _x = x - camera_get_view_x(oCamera.cam);
	var _y = y - camera_get_view_y(oCamera.cam);
	draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, c_black, lerp(-0.5, 1, dragWave.value));
	shader_set(shInnerOutline);
	shader_set_uniform_f(global.uInnerOutlineTexelSize, texelWidth, texelHeight);
	shader_set_uniform_f_array(global.uInnerOutlineUVs, uvs);
	draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, c_white, 1);
	shader_reset();
}
