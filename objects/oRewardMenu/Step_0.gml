/// @desc Manage everything

EnableLive;

// Fading
if (xScale > 0.3 or done)
	bgAlpha = Approach(bgAlpha, !done, 0.07);
	
alpha = Approach(alpha, active, 0.07);
xScale = ApproachEase(xScale, active, 0.15, 0.7);

if (alpha == 0 and !active and !done) {
	array_delete(menus, 0, 1);
	active = true;
}

if (bgAlpha == 0 and done) {
	global.gameState = GameState.IDLE;
	instance_destroy();
	exit;
}

// Click on cards
menus[0].GapScale(xScale, 1).Pos(x, y).Step();