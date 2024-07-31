/// @desc Manage Simulation

EnableLive;

// DEBUG
if (global.gameState == GameState.SIMULATION) {
	testingTimer += 1/60;
}


// Select Hovering
with(pElement)
	isHovered = false;
	
if (global.gameState == GameState.IDLE) {
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


// Check for goals
if (global.gameState == GameState.SIMULATION) {
		
}