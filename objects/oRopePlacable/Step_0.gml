/// @desc Move other end

var _interacting = (global.elementInteracting == id);

// Inherit the parent event
event_inherited();

if (global.gameState == GameState.IDLE and (!MouseOverToolbar() or !_interacting)) {
	if (is_undefined(x2)) {
		x2 = x;
		y2 = y;
		
		global.elementInteracting = id;
		dragXOffset = 0;
		dragYOffset = 0;
		isHovered = false;
		global.editorTool = EDITOR_TOOL.MOVE;
		global.gameState = GameState.EDITING_ELEMENT;
	} else {
		sprite_index = sRope;
		phy_rotation = -point_direction(x, y, x2, y2);
		image_xscale = point_distance(x, y, x2, y2) / 2;
		image_yscale = 1;
		if (-phy_rotation >= 135 and -phy_rotation < 305)
			image_yscale = -1;
	}
}

if (global.elementInteracting == id) {
	sprite_index = sRopePlaceable;
	phy_rotation = 0;
	image_xscale = 1;
	image_yscale = 1

}