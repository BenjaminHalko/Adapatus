/// @desc Hover over options

EnableLive;

if (elementInHand == noone) {
	var _previouslyHovered = elementHovered;
	elementHovered = -1;
	
	var _elemX = elementListXStart;
	for(var i = 0; i < array_length(usableElements); i++) {
		var _info = usableElements[i];
		var _active = (MouseOverToolbar() and MouseGUIX() >= _elemX and MouseGUIX() < _elemX + _info.width - 2);
		_info.hoveredPercent = ApproachEase(_info.hoveredPercent, _active, 0.1, 0.8);
		_info.burstEffect = ApproachEase(_info.burstEffect, 0, 0.1, 0.8);
		if (_active) {
			if (_previouslyHovered != i)
				_info.burstEffect = 1;
			elementHovered = i;
		}
		_elemX += _info.width - 2;
	}
	
	if (elementHovered != -1) {
		if (mouse_check_button_pressed(mb_left)) {
			global.elementInteracting = AddElement(usableElements[elementHovered].type, mouse_x, mouse_y, 0);
			global.elementInteracting.isHovered = true;
			global.elementInteracting.dragXOffset = 0;
			global.elementInteracting.dragYOffset = 0;
			elementInHand = global.elementInteracting;
		}
	}
} else {
	if (global.elementInteracting == noone and elementInHand != noone) {
		if (MouseOverToolbar())
			DeleteElement(elementInHand);
		elementInHand = noone;
	}
}	