/// @desc	rotates a vector by an angle
/// @param	{real} x
/// @param	{real} y
/// @param	{real} angle
function RotateVector(_x, _y, _angle) {
	var _dist = point_distance(0,0,_x,_y);
	var _dir = point_direction(0,0,_x,_y);
	return {
		x: lengthdir_x(_dist, _dir+_angle),
		y: lengthdir_y(_dist, _dir+_angle)
	}
}