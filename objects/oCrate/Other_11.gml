
EnableLive;

var _coords = RotateVector(-sprite_width / 2 + 1, sprite_height / 2, phy_rotation);

var _wall = instance_create_depth(x + _coords.x, y + _coords.y, depth-1, oCrateWall, {
	phy_rotation: phy_rotation
});

physics_joint_weld_create(id, _wall, x + _coords.x, y + _coords.y, 0, 0, 0, true);

_coords = RotateVector(sprite_width / 2 - 1, sprite_height / 2, phy_rotation);

_wall = instance_create_depth(x + _coords.x, y + _coords.y, depth-1, oCrateWall, {
	phy_rotation: phy_rotation
});

physics_joint_weld_create(id, _wall, x + _coords.x, y + _coords.y, 0, 0, 0, true);

image_index = 1;