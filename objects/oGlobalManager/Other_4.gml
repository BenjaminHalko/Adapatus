/// @desc Physics Setup

if (room == rLevel) {
	physics_world_update_iterations(30);
	physics_world_update_speed(120);
	
	if (!instance_exists(oSimulationManager))
		instance_create_layer(0, 0, "Manager", oSimulationManager);
}