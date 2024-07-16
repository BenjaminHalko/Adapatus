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
	physics_world_gravity(0, 10);
	with(pElement) {
		phy_active = true;
		
		var _list = ds_list_create();
		var _num = instance_position_list(x, y, pElement, _list, false);
		for(var i = 0; i < _num; i++) {
			var _obj = _list[| i];	
			if (_obj.priority >= priority)
				continue;
				
			physics_joint_revolute_create(id, _obj.id, x, y, 0, 0, false, 0, 0, false, false);
		}
		ds_list_destroy(_list);
	}
}

/// @desc	Resets the simulation back to its initial state
function SimulationReset() {
	physics_world_gravity(0, 0);
	global.simulationActive = false;
	instance_destroy(pElement);
	for (var i = 0; i < array_length(levelData.elements); i++) {
		var _params = levelData.elements[i];
		with(instance_create_layer(_params.x, _params.y, "Entities", global.elementConfigList[_params.type].object)) {
			isUnlocked = _params.isUnlocked;
			levelDataPos = i;
			phy_rotation = _params.rotation;
		}
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