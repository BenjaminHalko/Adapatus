/// @desc Default Element Update

EnableLive;

if (global.elementInHand == noone) {
	// Check if hovering
	if (isUnlocked and !global.simulationActive) {
		isHovered = instance_position(mouse_x, mouse_y, pElement) == id;
	} else {
		isHovered = false;	
	}

	// Select Object
	if (isHovered) {
		depth = -1000;
		if (mouse_check_button_pressed(mb_left)) {
			global.elementInHand = id;
			dragXOffset = mouse_x - x;
			dragYOffset = mouse_y - y;
		}
	} else {
		depth = layer_get_depth(initialLayer);
	}
}
