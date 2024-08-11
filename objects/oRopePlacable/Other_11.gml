/// @desc Create rope objects

var _density = 0.5;
var _widthHalf = 1;

var _dir = point_direction(x, y, x2, y2);
var _len = point_distance(x, y, x2, y2);

var _previous = noone;
for(var i = 0; i < _len; i += _widthHalf * 2) {
	var _rope = instance_create_depth(
		x + lengthdir_x(i+_widthHalf, _dir),
		y + lengthdir_y(i+_widthHalf, _dir),
		depth,
		oRope
	);
	
	with (_rope) {
		image_angle = _dir;
		if (instance_exists(_previous)) {
			joints = [
				physics_joint_revolute_create(id, _previous, x - lengthdir_x(_widthHalf, _dir), y - lengthdir_y(_widthHalf, _dir), 0, 0, 0, 0, 0, 0, 0),
				physics_joint_distance_create(id, _previous, x, y, _previous.x, _previous.y, false)
			];
			_previous.nextObject = id;
			previousObject = _previous;
		}
	}
	
	_previous = _rope;
}

instance_destroy();
