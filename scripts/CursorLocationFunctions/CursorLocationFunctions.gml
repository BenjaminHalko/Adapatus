/// @desc	Returns the X component of the mouse on the GUI
/// @return	{real}
function MouseGUIX() {
	return round(device_mouse_x_to_gui(0));
}

/// @desc	Returns the Y component of the mouse on the GUI
/// @return	{real}
function MouseGUIY() {
	return round(device_mouse_y_to_gui(0));
}

/// @desc	Returns if the mouse is in the screen
/// @return	{bool}
function MouseInWindow() {
	var _mx, _my;
	if (os_type != os_gxgames) {
		if (os_type == os_windows) {
			_mx = display_mouse_get_x() - window_get_x();
			_my = display_mouse_get_y() - window_get_y();  
		} else {
			_mx = device_mouse_raw_x(0);
			_my = device_mouse_raw_y(0);
		}
	
		return !((_mx < 0) || (_mx >= window_get_width()) || (_my < 0) || (_my >= window_get_height()));
	} else {
		return true;
	}
}

/// @desc	Returns if the mouse is over the toolbar
/// @return	{bool}
function MouseOverToolbar() {
	return MouseGUIY() >= ResHeight - oToolbar.toolbarBaseHeight and MouseInWindow();
}