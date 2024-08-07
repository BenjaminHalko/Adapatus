/// @desc Hover over options

EnableLive;

var _previouslyHovered = elementHovered;

if (elementInHand == noone)
	elementHovered = -1;
	
var _elemX = elementListXStart;
for(var i = 0; i < array_length(usableElements); i++) {
	var _info = usableElements[i];
	var _usable = global.elementQuantity[$ _info.__type] > 0 or elementHovered == i;
	
	_info.Pos(_elemX, ResHeight);
	
	// Hover Setup
	if (global.gameState == GameState.IDLE)
		_info.CheckIfHovered();
	else if (global.gameState == GameState.EDITING_ELEMENT)
		_info.__isHovered = (elementHovered == i);
	else
		_info.__isHovered = false;
	
	// Animate
	with (_info) {
		
		if (global.gameState == GameState.IDLE and other.elementInHand == noone and __isHovered)
			other.elementHovered = i;
		if (i == 0 or other.usableElements[i-1].__activePercent > 0.3) {
			__activePercent = ApproachEase(__activePercent, _usable, 0.1, 0.8);
			if (abs(__activePercent - _usable) < 0.005)
				__activePercent = _usable;
		}
		Animate();
	}
	
	// Delete
	if (!_usable and _info.__activePercent == 0) {
		array_delete(usableElements, i, 1);
		i--;
		continue;
	}
	
	// Spacing
	if (i != array_length(usableElements)-1) {
		_elemX += round((_info.__width - 2) * _info.__activePercent);
	}
}
	
if (elementHovered != -1 and elementInHand == noone and global.gameState == GameState.IDLE) {
	if (mouse_check_button_pressed(mb_left)) {
		global.gameState = GameState.EDITING_ELEMENT;
		global.editorTool = EDITOR_TOOL.MOVE;
		global.elementInteracting = AddElement(usableElements[elementHovered].__type, mouse_x, mouse_y, 0);
		global.elementInteracting.isHovered = true;
		global.elementInteracting.dragXOffset = 0;
		global.elementInteracting.dragYOffset = 0;
		global.elementInteracting.depth = -1000;
		elementInHand = global.elementInteracting;
		global.elementQuantity[$ usableElements[elementHovered].__type]--;
	}
}

if (global.gameState != GameState.EDITING_ELEMENT and elementInHand != noone) {
	if (MouseOverToolbar())
		DeleteElement(elementInHand);
	elementInHand = noone;
}