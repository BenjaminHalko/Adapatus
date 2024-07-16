/// @desc Manage Simulation

if (!global.simulationActive) {
	if (keyboard_check_pressed(ord("1")))
		AddElement(ELEMENT.PLAYER, mouse_x, mouse_y, 0);
	if (keyboard_check_pressed(ord("2")))
		AddElement(ELEMENT.WALL, mouse_x, mouse_y, 0);
	if (keyboard_check_pressed(ord("3")))
		AddElement(ELEMENT.BOX, mouse_x, mouse_y, 0);
	if (keyboard_check_pressed(ord("4")))
		AddElement(ELEMENT.LONG_BOX, mouse_x, mouse_y, 0);
	if (keyboard_check_pressed(ord("5")))
		AddElement(ELEMENT.SPIKE, mouse_x, mouse_y, 0);
}
else {
	testingTimer += 1/60;	
}

