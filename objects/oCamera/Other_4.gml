/// @desc Create Camera

if (room != rLevel) {
	x = 0;
	y = 0;
}

cam = view_camera[0];
camera_set_view_size(cam, ResWidth, ResHeight);
camera_set_view_pos(cam, round(x), round(y));

movingCamera = false;