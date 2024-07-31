globalvar levelData;

/// @desc	Loads the level
/// @param	{string} filename
function LoadLevel(_filename) {
	levelData = new LevelSaveData(_filename);
	
	ReloadLevel();
}

/// @desc	Reloads the level
function ReloadLevel() {
	UpdateUsableElements(levelData.elementQuantity);
	global.placedElements = [];
	for(var i = 0; i < array_length(levelData.elements); i++) {
		try {
			var _info = levelData.elements[i];
			array_push(global.placedElements, new ElementParams(_info.type, _info.x, _info.y, _info.rotation, false));
		} catch(_e) {
			show_debug_message(_e);	
		}
	}
	
	
	SimulationReset();
	
	
	Notification($"Loaded Level: {levelData.savefile}");
}

/// @desc	Saves the level and removes "isUnlocked" from the level data
function SaveLevelData() {
	levelData.elements = [];
	
	for(var i = 0; i < array_length(global.placedElements); i++) {
		var _info = global.placedElements[i];
		if (!_info.isUnlocked) {
			var _infoToAdd = variable_clone(_info);
			struct_remove(_infoToAdd, "isUnlocked");
			array_push(levelData.elements, _infoToAdd);
		}
	}
	
	levelData.saveData();
	
	Notification($"Saved Level: {levelData.savefile}");
}