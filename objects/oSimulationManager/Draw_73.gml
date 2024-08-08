/// @desc 

if (global.drawPhysicsDebug) {
	draw_set_color(c_black);
	for(var i = 0; i < array_length(global.snapList); i++) {
		with(global.snapList[i]) {
			var _pos = GetPos();
			if (is_instanceof(self, __SnapPoint))
				draw_circle(_pos.x, _pos.y, 2, false);
			else
				draw_line(_pos.x1, _pos.y1, _pos.x2, _pos.y2);
		}
	}
}