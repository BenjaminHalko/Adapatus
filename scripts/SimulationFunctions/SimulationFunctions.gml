enum TOOL_MODE {
	Move,
	Rotate
}

global.inLevelEditor = false;
global.elementQuantity = {};
global.placedElements = [];

function SimulationStart() {
	global.gameState = GameState.SIMULATION_RESETTING;
	room_restart();
}

/// @desc	Starts the simulation by activating physics
function __SimulationStart() {
	global.gameState = GameState.SIMULATION;
	oSimulationManager.testingTimer = 0;
	
	var _array = [];
	with(pElement)
		array_push(_array, id);	
		
	array_sort(_array, function(_a, _b) {
		return (_a.levelDataPos - _b.levelDataPos) + (_b.priority - _a.priority) * array_length(global.placedElements);
	});
		
	for(var i = 0; i < array_length(_array); i++) {
		with(_array[i])
			event_user(1);
	}
	
	for(var i = 0; i < array_length(_array); i++) {
		with(_array[i])
			event_user(2);
	}
	
	_array = [];
	with(pElement)
		array_push(_array, id);
	array_sort(_array, function(_a, _b) {
		return (_a.levelDataPos - _b.levelDataPos) + (_b.priority - _a.priority) * array_length(global.placedElements);
	});
	
	for(var i = 0; i < array_length(_array); i++)
		_array[i].phy_active = true;
}

/// @desc	Resets the simulation back to its initial state
function SimulationReset() {
	EnableLive;
	
	global.gameState = GameState.SIMULATION_RESETTING;
	instance_destroy(pElement);
	
	global.gameState = GameState.IDLE;
	for (var i = 0; i < array_length(global.placedElements); i++) {
		var _params = global.placedElements[i];
		var _vars = {
			phy_active: false,
			phy_rotation: _params.rotation
		};
		var _extraData = global.elementConfigList[_params.type].extraData;
		if (!is_undefined(_extraData)) {
			for (var j = 0; j < array_length(_extraData); j++) {
				_vars[$ _extraData[j]] = _params[$ _extraData[j]];
			}
		}
		with(instance_create_layer(_params.x, _params.y, "Entities", global.elementConfigList[_params.type].object, _vars)) {
			isUnlocked = _params.isUnlocked;
			levelDataPos = i;
		}
	}
	
	with(pElement)
		event_user(0);
		
	GoalsOnSimulationReset();
	CollectAllSnaps();
}

/// @desc	This is a configuration for an element, used to map 
/// @param	{Asset.GMObject} object
/// @param	{string} name
/// @param	{array<string>} [extraData]
function ElementTypeConfig(_object, _name, _extraData=undefined) constructor {
	object = _object;
	name = _name;
	extraData = _extraData;
}

/// @desc	This is a entry for an element
/// @param	{struct} params
/// @param	{bool} isUnlocked
function ElementParams(_params, _isUnlocked) constructor {
	type = _params.type;
	x = _params.x;
	y = _params.y;
	rotation = _params.rotation;
	isUnlocked = _isUnlocked;
	
	var _extraData = global.elementConfigList[type].extraData;
	if (!is_undefined(_extraData)) {
		for (var i = 0; i < array_length(_extraData); i++) {
			if (!struct_exists(_params, _extraData[i]))
				continue;
			struct_set(self, _extraData[i], _params[$ _extraData[i]]);
		}
	}
}