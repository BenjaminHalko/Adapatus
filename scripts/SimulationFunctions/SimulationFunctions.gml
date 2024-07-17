enum TOOL_MODE {
	Move,
	Rotate
}

global.simulationActive = false;
global.inLevelEditor = true;

/// @desc	Starts the simulation by activating physics
function SimulationStart() {
	global.simulationActive = true;
	oSimulationManager.testingTimer = 0;
	
	var _array = [];
	with(pElement)
		array_push(_array, id);	
		
	array_sort(_array, function(_a, _b) {
		return (_a.levelDataPos - _b.levelDataPos) + (_b.priority - _a.priority) * array_length(levelData.elements);
	});
		
	for(var i = 0; i < array_length(_array); i++) {
		with(_array[i])
			event_user(1);
	}
	
	for(var i = 0; i < array_length(_array); i++)
		_array[i].phy_active = true;
}

/// @desc	Resets the simulation back to its initial state
function SimulationReset() {
	EnableLive;
	
	global.simulationActive = false;
	instance_destroy(pElement);
	
	for (var i = 0; i < array_length(levelData.elements); i++) {
		var _params = levelData.elements[i];
		with(instance_create_layer(_params.x, _params.y, "Entities", global.elementConfigList[_params.type].object, {
			phy_active: false,
			image_angle: _params.rotation,
			phy_rotation: _params.rotation
		})) {
			isUnlocked = _params.isUnlocked;
			levelDataPos = i;
			image_angle = _params.rotation;
		}
	}
	
	with(pElement)
		event_user(0);
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