/// @desc Create Flame Particles

// Inherit the parent event
event_inherited();

if (global.gameState == GameState.SIMULATION and activated) {
	instance_create_depth(x+18+random_range(-2, 2), y-6+random_range(-2, 2), depth+1, oFlameParticle);
	image_index = activated;
}
