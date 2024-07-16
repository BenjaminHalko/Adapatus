/// @desc Move Object

EnableLive;

if (global.elementInHand == id) {
	if (isHovered) {
		isHovered = false;
		exit;
	}
	
	phy_position_x = round(mouse_x - dragXOffset);
	phy_position_y = round(mouse_y - dragYOffset);	
	
	if (mouse_check_button_pressed(mb_left)) {
		global.elementInHand = noone;
		depth = layer_get_depth(initialLayer);
		phy_rotation = levelData.elements[levelDataPos].rotation;
	
		levelData.elements[levelDataPos].x = phy_position_x;
		levelData.elements[levelDataPos].y = phy_position_y;
	}
}