/// @desc Manage Simulation

if (global.inLevelEditor and !global.simulationActive) {
	if (keyboard_check_pressed(ord("1")))
		AddElement(ELEMENT.PLAYER, mouse_x, mouse_y, 0);
	if (keyboard_check_pressed(ord("2")))
		AddElement(ELEMENT.WALL, mouse_x, mouse_y, 20);
}
