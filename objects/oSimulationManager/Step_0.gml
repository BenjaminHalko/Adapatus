/// @desc Manage Simulation

// DEBUG
if (!global.simulationActive) {
	if (keyboard_check_pressed(ord("1")))
		AddElement(ELEMENT.WHEEL, mouse_x, mouse_y, 0);
	if (keyboard_check_pressed(ord("2")))
		AddElement(ELEMENT.WALL, mouse_x, mouse_y, 0);
	if (keyboard_check_pressed(ord("3")))
		AddElement(ELEMENT.BOX, mouse_x, mouse_y, 0);
	if (keyboard_check_pressed(ord("4")))
		AddElement(ELEMENT.LONG_BOX, mouse_x, mouse_y, 0);
	if (keyboard_check_pressed(ord("5")))
		AddElement(ELEMENT.SPIKE, mouse_x, mouse_y, 0);
	if (keyboard_check_pressed(ord("6")))
		AddElement(ELEMENT.MOTORIZED_WHEEL, mouse_x, mouse_y, 0);
}
else {
	testingTimer += 1/60;	
}


// Select Hovering
with(pElement)
	isHovered = false;
	
if (!global.simulationActive and global.elementInteracting == noone) {
	var _list = ds_list_create();
	var _num = instance_position_list(mouse_x, mouse_y, pElement, _list, false);
	var _listArray = array_create(_num);
	for(var i = 0; i < _num; i++)
		_listArray[i] = _list[| i];
	ds_list_destroy(_list);
		
	array_sort(_listArray, function(_a, _b) {
		return _b.priority - _a.priority;
	});
		
	for(var i = 0; i < _num; i++) {
		var _obj = _listArray[i];
		if (_obj.isUnlocked or global.inLevelEditor) {
			_obj.isHovered = true;
			break;
		}	
	}
}
