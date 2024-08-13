/// @desc Detect Bind

EnableLive;

// Inherit the parent event
event_inherited();

if (global.gameState != GameState.SIMULATION) {
	var _elements = GetOverlappingElements(phy_position_x, phy_position_y);
	isBound = array_length(_elements) > 0;
}

bindPercent = ApproachEase(bindPercent, isBound, 0.1, 0.8);