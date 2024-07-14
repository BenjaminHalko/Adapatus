enum COLOR {
	SHADOW,
	DARK,
	MID,
	LIGHT
}

/// @desc	Draws a rectangle
/// @param	{real} x1
/// @param	{real} y1
/// @param	{real} x2
/// @param	{real} y2
/// @param	{enum.COLOR} color
function DrawRectangle(_x1, _y1, _x2, _y2, _color) {
	draw_set_color(make_color_rgb(_color * 80, 0, 0));
	draw_rectangle(_x1, _y1, _x2, _y2, false);
}