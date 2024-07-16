/// @desc Draw Collisions

EnableLive;

if (global.elementInHand != id and !global.simulationActive) {
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
		
	} else if (isUnlocked and !global.inLevelEditor) {
		draw_sprite_ext(sprite_index, image_index, x+1, y-1, image_xscale, image_yscale, image_angle, c_black, image_alpha);
		draw_sprite_ext(sprite_index, image_index, x+1, y+1, image_xscale, image_yscale, image_angle, c_black, image_alpha);
		draw_sprite_ext(sprite_index, image_index, x-1, y-1, image_xscale, image_yscale, image_angle, c_black, image_alpha);
		draw_sprite_ext(sprite_index, image_index, x-1, y+1, image_xscale, image_yscale, image_angle, c_black, image_alpha);
	} 
}

if (isColliding) {
	surface_set_target(collisionSurface);
	draw_clear_alpha(c_black, 0);
	
	gpu_set_colorwriteenable(1, 1, 1, 0);
	
	shader_set(shCollision);
	with(pElement) {
		if (id == other.id)
			continue;
		draw_sprite_ext(sprite_index, image_index, x - other.x + other.collisionSurfaceW / 2, y - other.y + other.collisionSurfaceH / 2, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	}
	shader_reset();
	
	gpu_set_colorwriteenable(0, 0, 0, 1);
	
	draw_sprite_ext(sprite_index, image_index, other.collisionSurfaceW / 2, other.collisionSurfaceH / 2, image_xscale, image_yscale, image_angle, c_black, image_alpha);
	
	gpu_set_colorwriteenable(1, 1, 1, 1);
	
	surface_reset_target();
	
	draw_surface(collisionSurface, x - collisionSurfaceW / 2, y - collisionSurfaceH / 2);
} else {
	draw_self();	
}

draw_set_color(c_black);