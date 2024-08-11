global.transitionFade = 1;

/// @desc	Moves you to another room
/// @param	{Asset.GMRoom} room
function Transition(_room) {
	if (!instance_exists(oTransition)) {
		instance_create_depth(0, 0, 0, oTransition, {roomTo: _room});
	} else {
		with(oTransition) {
			roomTo = _room
			fadingOut = true;
			wait = waitMax;
		}
	}
}