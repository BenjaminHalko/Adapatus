/// @desc	Draws a progress bar to the screen
/// @param	{real} x
/// @param	{real} y
/// @param	{real} width
/// @param	{real} percent
/// @param	{real} alpha
function DrawProgressBar(_x, _y, _width, _percent, _alpha=1) {
	var _size = 8;
	var _border = 2;
	_y -= _size / 2;
	_x -= _width / 2;
	
	_x = round(_x);
	_y = round(_y);
	
	draw_sprite_ext(sProgressBar, _percent, _x + 2, _y + 2, _width / _size, 1, 0, c_black, _alpha);
	
	if (_percent == 0 or _percent == 1) {
		draw_sprite_ext(sProgressBar, _percent, _x, _y, _width / _size, 1, 0, c_white, _alpha);
	} else {
		draw_sprite_ext(sProgressBar, 0, _x, _y, _width / _size, 1, 0, c_white, _alpha);
		draw_sprite_ext(sProgressBarFill, 0, _x + _border, _y + _border, (_width - _border * 2) * _percent, 1, 0, c_white, _alpha);
	}
}