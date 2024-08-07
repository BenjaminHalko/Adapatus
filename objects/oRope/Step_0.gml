/// @desc Break Rope

// Inherit the parent event
event_inherited();

if (global.gameState == GameState.SIMULATION) {
	if (instance_exists(previousObject)) {
		if (point_distance(x, y, previousObject.x, previousObject.y) > 4) {
			breakTimer++;
			if (breakTimer > 15) {
				physics_joint_delete(joints[0]);
				physics_joint_delete(joints[1]);
				previousObject = noone;
			}
		} else {
			breakTimer = 0;	
		}
	}
}