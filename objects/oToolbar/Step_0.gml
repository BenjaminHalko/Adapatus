/// @desc Hover over options

EnableLive;

var _previouslyHovered = elementHovered;

if (elementInHand == noone)
	elementHovered = -1;
	
var _elemX = elementListXStart;
for(var i = 0; i < array_length(usableElements); i++) {
	var _info = usableElements[i];
	var _usable = global.elementQuantity[$ _info.type] > 0 or elementHovered == i;
	var _active = false;
	
	// Hover Setup
	if (global.gameState == GameState.IDLE) {
		_active = (MouseOverToolbar() and MouseGUIX() >= _elemX and MouseGUIX() < _elemX + _info.width - 3);
	} else if (global.gameState == GameState.EDITING_ELEMENT)
		_active = (elementHovered == i);
	
	// Animate
	_info.hoveredPercent = ApproachEase(_info.hoveredPercent, _active, 0.1, 0.8);
	if (abs(_info.hoveredPercent - _active) < 0.005)
		_info.hoveredPercent = _active;
	_info.burstEffect = ApproachEase(_info.burstEffect, 0, 0.1, 0.8);
	
	if (i == 0 or usableElements[i-1].activePercent > 0.3) {
		_info.activePercent = ApproachEase(_info.activePercent, _usable, 0.1, 0.8);
		if (abs(_info.activePercent - _usable) < 0.005)
			_info.activePercent = _usable;
	}
	
	// Delete
	if (!_usable and _info.activePercent == 0) {
		array_delete(usableElements, i, 1);
		i--;
		continue;
	}
	
	// Hover
	if (_active) {
		if (_previouslyHovered != i)
			_info.burstEffect = 1;
		if (global.gameState == GameState.IDLE and elementInHand == noone)
			elementHovered = i;
	}
	
	// Spacing
	if (i != array_length(usableElements)-1) {
		_elemX += round((_info.width - 3) * _info.activePercent);
	}
}
	
if (elementHovered != -1 and elementInHand == noone and global.gameState == GameState.IDLE) {
	if (mouse_check_button_pressed(mb_left)) {
		global.gameState = GameState.EDITING_ELEMENT;
		global.elementInteracting = AddElement(usableElements[elementHovered].type, mouse_x, mouse_y, 0);
		global.elementInteracting.isHovered = true;
		global.elementInteracting.dragXOffset = 0;
		global.elementInteracting.dragYOffset = 0;
		elementInHand = global.elementInteracting;
		global.elementQuantity[$ usableElements[elementHovered].type]--;
	}
}

if (global.gameState != GameState.EDITING_ELEMENT and elementInHand != noone) {
	if (MouseOverToolbar())
		DeleteElement(elementInHand);
	elementInHand = noone;
}