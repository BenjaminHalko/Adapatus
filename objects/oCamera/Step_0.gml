/// @desc Pan Camera

if (global.gameState == GameState.IDLE or global.gameState == GameState.SIMULATION) and (!movingCamera) {
	if (keyboard_check_pressed(vk_alt)) {
		movingCamera = true;
		if (global.gameState == GameState.IDLE)
			global.gameState = GameState.MOVING_CAMERA;
		window_mouse_set_locked(true);
	}
} else if (movingCamera) {
	x -= window_mouse_get_delta_x() / 2;
	y -= window_mouse_get_delta_y() / 2;
	
	if (mouse_check_button_pressed(mb_right)) {
		x = 0;
		y = 0;
	}
	
	camera_set_view_pos(cam, round(x), round(y));

	if (!keyboard_check(vk_alt)) {
		movingCamera = false;
		window_mouse_set_locked(false);
		if (global.gameState == GameState.MOVING_CAMERA)
			global.gameState = GameState.IDLE;
	}
}