/// @desc Default Element Update

EnableLive;

if (global.elementInteracting == noone) {
	// Check if hovering
	if ((isUnlocked or global.inLevelEditor) and !global.simulationActive) {
		isHovered = false;
		var _list = ds_list_create();
		var _num = instance_position_list(mouse_x, mouse_y, pElement, _list, false);
		for(var i = 0; i < _num; i++) {
			var _obj = _list[| i];
			if (_obj.id == id) {
				isHovered = true;
				break;
			}
			if (_obj.isUnlocked or global.inLevelEditor)
				break;
		}
		ds_list_destroy(_list);
	} else {
		isHovered = false;	
	}

	// Select Object
	if (isHovered) {
		depth = -1000 - priority;
		if (mouse_check_button_pressed(mb_left)) {
			global.elementInteracting = id;
			dragXOffset = mouse_x - x;
			dragYOffset = mouse_y - y;
			isHovered = false;
			global.editorTool = EDITOR_TOOL.MOVE;
		}
		
		if (mouse_check_button_pressed(mb_right)) {
			global.elementInteracting = id;
			isHovered = false;
			global.editorTool = EDITOR_TOOL.ROTATE;
		}
		
		if (keyboard_check_pressed(vk_backspace)) {
			isUnlocked = !isUnlocked;
			EditElement(id);
		}
		
		if (mouse_check_button_pressed(mb_middle)) {
			DeleteElement(id);
		}
	} else {
		if (isUnlocked) {
			depth = -500 - priority;	
		} else {
			depth = - priority;	
		}
	}
} else if (global.elementInteracting == id) {
	switch (global.editorTool) {
		case EDITOR_TOOL.MOVE:
			phy_position_x = round(mouse_x - dragXOffset);
			phy_position_y = round(mouse_y - dragYOffset);	
	
			if (!mouse_check_button(mb_left)) {
				global.elementInteracting = noone;
				depth = -500;
				EditElement(id);
			}
		break;
		case EDITOR_TOOL.ROTATE:
			phy_rotation = round(-point_direction(x, y, mouse_x, mouse_y)/360*24) * (360/24);
			
			if (!mouse_check_button(mb_right)) {
				global.elementInteracting = noone;
				depth = -500;
				EditElement(id);
			}
		break;
	}
}
