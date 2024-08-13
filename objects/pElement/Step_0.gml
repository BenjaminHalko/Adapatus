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
			global.gameState = GameState.EDITING_ELEMENT;
		}
		
		if (mouse_check_button_pressed(mb_right)) {
			global.elementInteracting = id;
			isHovered = false;
			global.editorTool = EDITOR_TOOL.ROTATE;
			global.gameState = GameState.EDITING_ELEMENT;
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
			var _mx = round(mouse_x - dragXOffset);
			var _my = round(mouse_y - dragYOffset);
			
			if (lastDragPositionX != _mx or lastDragPositionY != _my) {
				lastDragPositionX = _mx;
				lastDragPositionY = _my;
				
				var _snap = SnapToPoint(mouse_x, mouse_y);
				if (!is_undefined(_snap)) {
					phy_position_x = round(_snap.x);
					phy_position_y = round(_snap.y);
				
					if (is_instanceof(_snap.snap, __SnapLine)) {
						var _pos = _snap.snap.GetPos();
						var _dir = point_direction(_pos.x1, _pos.y1, _pos.x2, _pos.y2);
						phy_rotation = -_dir;
					}
				} else {
					phy_position_x = round(_mx);
					phy_position_y = round(_my);
				}
			}
	
			if (mouse_check_button_released(mb_left)) {
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