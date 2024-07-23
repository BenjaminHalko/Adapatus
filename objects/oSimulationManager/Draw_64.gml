/// @desc Draw GUI

EnableLive;

if (global.simulationActive)
draw_text(ResWidth - 20, 8, testingTimer);

/*

// Draw Bar
DrawRectangle(0, ResHeight - ToolbarHeight, ResWidth, ResHeight, COLOR.SHADOW);




draw_set_color(c_white);
var _sprites = [sBall, sWall, sBox, sLongBox, sSpike];
for(var i = 0; i < 5; i++) {
	draw_text(20 + i * 60, ResHeight - 20, i + 1);
	draw_sprite(_sprites[i], 0, 50 + i * 60, ResHeight - 12 + 5 * (i == 4));
}

draw_text(320, ResHeight - 36, "Left - Move");
draw_text(320, ResHeight - 26, "Right - Rotate");
draw_text(320, ResHeight - 16, "Middle - Delete");
//draw_text(40, ResHeight - 10, "Left - Move");
