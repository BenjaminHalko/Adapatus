/// @desc Draw Self

EnableLive;

if (!global.drawPhysicsDebug) {
	if (global.elementInteracting != id and global.gameState != GameState.SIMULATION) {
		if (isHovered) {
			shader_set(shWhite);
			draw_sprite_ext(sprite_index, image_index, x+2, y-2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			draw_sprite_ext(sprite_index, image_index, x+2, y+2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			draw_sprite_ext(sprite_index, image_index, x-2, y-2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			draw_sprite_ext(sprite_index, image_index, x-2, y+2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
		
			draw_sprite_ext(sprite_index, image_index, x+2, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			draw_sprite_ext(sprite_index, image_index, x-2, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			draw_sprite_ext(sprite_index, image_index, x, y-2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			draw_sprite_ext(sprite_index, image_index, x, y+2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
			shader_reset();
		
			draw_sprite_ext(sprite_index, image_index, x+1, y-1, image_xscale, image_yscale, image_angle, c_black, image_alpha);
			draw_sprite_ext(sprite_index, image_index, x+1, y+1, image_xscale, image_yscale, image_angle, c_black, image_alpha);
			draw_sprite_ext(sprite_index, image_index, x-1, y-1, image_xscale, image_yscale, image_angle, c_black, image_alpha);
			draw_sprite_ext(sprite_index, image_index, x-1, y+1, image_xscale, image_yscale, image_angle, c_black, image_alpha);
		
		} else if (isUnlocked) {
			draw_sprite_ext(sprite_index, image_index, x+1, y-1, image_xscale, image_yscale, image_angle, c_black, image_alpha);
			draw_sprite_ext(sprite_index, image_index, x+1, y+1, image_xscale, image_yscale, image_angle, c_black, image_alpha);
			draw_sprite_ext(sprite_index, image_index, x-1, y-1, image_xscale, image_yscale, image_angle, c_black, image_alpha);
			draw_sprite_ext(sprite_index, image_index, x-1, y+1, image_xscale, image_yscale, image_angle, c_black, image_alpha);
		} 
	}

	if (global.elementInteracting != id)
		draw_self();
} else {
	draw_set_color(c_white);
	physics_draw_debug();
}