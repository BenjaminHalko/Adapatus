/// @desc	Creates a new save data struct
function LevelSaveData() : SaveLoadParent("levelData/level") constructor {
	// Entities already existing in the level
	elements = [];
	
	// Entities the player is allowed to use
	allowedElements = [];
	
	// Load data
	loadData();
}

/// @ignore
function SaveLoadParent(_savefile) constructor {
	savefile = _savefile + ".sav";
	
	static loadData = function() {
		// Attempt loading data
		try {
			if (file_exists(savefile)) {
				// Load data
				var _file = file_text_open_read(savefile);
				var _string = "";
				while(!file_text_eof(_file)) {
					_string += file_text_read_string(_file);
					file_text_readln(_file);
				}
				file_text_close(_file);

				// Parse data
				var _data = json_parse(_string);
	
				// Write data
				var _existingData = copyData();
		
				var _existingNames = variable_struct_get_names(_existingData);
				for(var i = 0; i < array_length(_existingNames); i++) {
					self[$ _existingNames[i]] = _data[$ _existingNames[i]];
				}
			}
		} catch (_exception) {
			show_debug_message(_exception);
		}
	}
	
	/// @desc Saves data to a file
	static saveData = function() {
		// Get data to save
		var _data = copyData();
		var _outputData = json_stringify(_data, true);
		var _file = file_text_open_write(savefile);
		file_text_write_string(_file, _outputData);
		file_text_close(_file);
	}
	
	/// @desc Returns a copy of the save data
	/// @return {struct}
	static copyData = function() {
		var _data = variable_clone(self);
		struct_remove(_data, "saveData");
		struct_remove(_data, "loadData");
		struct_remove(_data, "copyData");
		struct_remove(_data, "savefile");
		return _data
	}
}