function PinElement() {
	EnableLive;
	var _pin = instance_create_depth(x, y, depth, oStaticPin, {phy_rotation: phy_rotation});
	ApplyJoint(id, _pin, physics_joint_weld_create(id, _pin, x, y, 0, 0, 20, false));
}