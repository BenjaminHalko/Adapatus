/// @desc Setup Snap Points

// Inherit the parent event
event_inherited();

var _x1 = -sprite_width/2;
var _y1 = -sprite_height/2;
var _x2 = sprite_width/2;
var _y2 = sprite_height/2;

SnapLine(_x1, _y1, _x2, _y1);
SnapLine(_x2, _y1, _x2, _y2);
SnapLine(_x2, _y2, _x1, _y2);
SnapLine(_x1, _y2, _x1, _y1);