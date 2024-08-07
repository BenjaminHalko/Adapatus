/// @desc Default Element Update

EnableLive;

if (global.elementInteracting == noone) {
	// Select Object
	if (isHovered) {
		depth = -1000;
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
		depth = -priority * array_length(global.placedElements) - levelDataPos;
	}
} else if (global.elementInteracting == id) {
	depth = -1000;
	isHovered = true;
	switch (global.editorTool) {
		case EDITOR_TOOL.MOVE:
			phy_position_x = round(mouse_x - dragXOffset);
			phy_position_y = round(mouse_y - dragYOffset);	
	
			if (!mouse_check_button(mb_left)) {
				global.elementInteracting = noone;
				global.gameState = GameState.IDLE;
				EditElement(id);
			}
		break;
		case EDITOR_TOOL.ROTATE:
			phy_rotation = round(round(-point_direction(x, y, mouse_x, mouse_y)/360*24) * (360/24));
			
			if (!mouse_check_button(mb_right)) {
				global.elementInteracting = noone;
				global.gameState = GameState.IDLE;
				EditElement(id);
			}
		break;
		default:
			global.elementInteracting = noone;
		break;
	}
}