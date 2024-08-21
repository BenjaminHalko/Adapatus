/// @desc Creates an explosion
function CreateExplosion(_x, _y, _radius, _force) {
	var _list = ds_list_create();
	var _num = collision_circle_list(_x, _y, _radius, pElement, true, true, _list, false);
	for(var i = 0; i < _num; i++) {
		var _dir = point_direction(_x, _y, _list[| i].x, _list[| i].y);
		physics_apply_impulse(_x, _y, lengthdir_x(_force, _dir), lengthdir_y(_force, _dir));
	}
}