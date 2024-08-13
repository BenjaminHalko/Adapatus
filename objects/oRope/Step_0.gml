/// @desc Break Rope

// Inherit the parent event
event_inherited();

if (global.gameState == GameState.SIMULATION) {
	var _object = joints[0].boundElement;
	if (instance_exists(_object)) {
		if (point_distance(x, y, _object.x, _object.y) > 4 and false) {
			breakTimer++;
			if (breakTimer > 15) {
				joints[0].Destroy();
				joints[1].Destroy();
				previousObject = noone;
			}
		} else {
			breakTimer = 0;	
		}
	}
}