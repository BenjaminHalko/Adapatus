/// @desc Check if on fire

if (global.gameState != GameState.SIMULATION)
	instance_destroy();

if (flameTriggered)
	exit;
	
if (managedPosition) {
	x = creator.x+lengthdir_x(distOffset, dirOffset+creator.image_angle-creatorAngleStart);
	y = creator.y+lengthdir_y(distOffset, dirOffset+creator.image_angle-creatorAngleStart);
	image_angle = creator.image_angle-creatorAngleStart+myAngleStart;
}
	
if (place_meeting(x, y, pFlame))
	flameTriggered = true;
