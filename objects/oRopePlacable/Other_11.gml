/// @desc Create rope objects

var _density = 0.5;
var _widthHalf = 1;
var _segments = 0;

var _dir = point_direction(x, y, x2, y2);
var _len = point_distance(x, y, x2, y2);

var _startX = undefined;
var _startY = undefined;

var _previous = noone;
for(var i = 0; i < _len; i += _widthHalf * 2) {
	var _rope = instance_create_depth(
		x + lengthdir_x(i+_widthHalf, _dir),
		y + lengthdir_y(i+_widthHalf, _dir),
		depth,
		oRope
	);
	
	_segments++;
	
	with (_rope) {
		image_angle = -_dir;
		phy_rotation = -_dir;
		if (instance_exists(_previous)) {
			ApplyJoint(id, _previous, physics_joint_revolute_create(id, _previous, x - lengthdir_x(_widthHalf, _dir), y - lengthdir_y(_widthHalf, _dir), 0, 0, 0, 0, 0, 0, 0));
			ApplyJoint(id, _previous, physics_joint_distance_create(id, _previous, x, y, _previous.x, _previous.y, false)); 
		} else {
			var _list = GetOverlappingElements(x - lengthdir_x(_widthHalf, _dir), y - lengthdir_y(_widthHalf, _dir));
			for(var j = 0; j < array_length(_list); j++) {
				var _obj = _list[j];
				if (_obj == id)
					continue;
				if (_obj.object_index == oRope)
					continue;
				ApplyJoint(id, _obj.id, physics_joint_revolute_create(id, _obj.id, x - lengthdir_x(_widthHalf, _dir), y - lengthdir_x(_widthHalf, _dir), 0, 0, false, 0, 0, false, false));
				ApplyJoint(id, _obj.id, physics_joint_distance_create(id, _obj.id, x, y, _obj.x, _obj.y, false));
				
				
				
			}
		}
	}
	
	_previous = _rope;
}

with(_previous) {
	var _list = GetOverlappingElements(x + lengthdir_x(_widthHalf, _dir), y + lengthdir_y(_widthHalf, _dir));
	for(var i = 0; i < array_length(_list); i++) {
		var _obj = _list[i];
		if (_obj == id)
			continue;
		if (_obj.object_index == oRope)
			continue;
		ApplyJoint(id, _obj.id, physics_joint_revolute_create(id, _obj.id, x + lengthdir_x(_widthHalf, _dir), y + lengthdir_y(_widthHalf, _dir), 0, 0, false, 0, 0, false, false));
		ApplyJoint(id, _obj.id, physics_joint_distance_create(id, _obj.id, x, y, _obj.x, _obj.y, false));
	}
}


var _startElements = GetOverlappingElements(x, y);
var _endElements = GetOverlappingElements(x2, y2);

for(var i = 0; i < array_length(_startElements); i++) {
	for(var j = 0; j < array_length(_endElements); j++) {
		var _s = _startElements[i];
		var _e = _endElements[j];
		ApplyJoint(_s, _e, physics_joint_rope_create(_s, _e, x, y, x2, y2, _len + _segments / 10, true));
	}
}

instance_destroy();
