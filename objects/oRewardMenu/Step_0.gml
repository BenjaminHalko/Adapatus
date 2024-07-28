/// @desc Manage everything

EnableLive;

// Fading
if (xScale > 0.5 or done)
	bgAlpha = Approach(bgAlpha, !done, 0.07);
	
alpha = Approach(alpha, active, 0.07);
xScale = ApproachEase(xScale, active, 0.15, 0.7);

if (alpha == 0 and !active and !done) {
	array_delete(choiceQueue, 0, 1);
	active = true;
}

if (bgAlpha == 0 and done) {
	global.gameState = GameState.IDLE;
	instance_destroy();
	exit;
}

// Click on cards
if (active) {
	elementHovered = -1;
	var _mx = MouseGUIX();
	var _my = MouseGUIY();
	for(var i = 0; i < array_length(choiceQueue[0]); i++) {
		var _info = choiceQueue[0][i];
		_info.CheckIfHovered();
		if (_info.__isHovered) {
			elementHovered = i;
		}
	}
	
	if (elementHovered != -1) {
		if (mouse_check_button_pressed(mb_left)) {
			var _info = choiceQueue[0][elementHovered];
			active = false;	
			global.elementQuantity[$ _info.__type] += _info.__quantity;
			AddUsableElement(_info.__type);
			if (array_length(choiceQueue) == 1)
				done = true;
		}
	}
}


