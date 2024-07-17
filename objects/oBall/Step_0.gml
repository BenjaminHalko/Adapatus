/// @desc Detect Bind

EnableLive;

// Inherit the parent event
event_inherited();

var _list = ds_list_create();
var _num = instance_position_list(phy_position_x, phy_position_y, pElement, _list, false);
ds_list_destroy(_list);
bindPercent = ApproachEase(bindPercent, _num > 1, 0.1, 0.8);