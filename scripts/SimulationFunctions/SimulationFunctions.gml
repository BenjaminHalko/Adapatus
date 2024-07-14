global.simulationActive = false;
global.inLevelEditor = true;

/// @desc	Starts the simulation by activating physics
function SimulationStart() {
	global.simulationActive = true;
	with(pElement) {
		phy_active = true;
	}
}

/// @desc	Resets the simulation back to its initial state
function SimulationReset() {
	global.simulationActive = false;
	instance_destroy(pElement);
	for (var i = 0; i < array_length(levelData.elements); i++) {
		var _params =		levelData.elements[i];
		instance_create_layer(_params.x, _params.y, "Entities", _params.type, {
			isUnlocked: _params.isUnlocked,
			levelDataPos: i,
			phy_rotation: _params.rotation
		});
	}
}

/// @desc	This is a configuration for an element, used to map 
/// @param	{Asset.GMObject} object
/// @param	{string} name
function ElementTypeConfig(_object, _name) constructor {
	object = _object;
	name = _name;
}

/// @desc	This is a entry for an element
/// @param	{enum.ELEMENT_TYPE} type
/// @param	{real} x
/// @param	{real} y
/// @param	{real} rotation
/// @param	{bool} isUnlocked
function ElementParams(_type, _x, _y, _rotation, _isUnlocked) constructor {
	type = _type;
	x = _x;
	y = _y;
	rotation = _rotation;
	isUnlocked = _isUnlocked;
}