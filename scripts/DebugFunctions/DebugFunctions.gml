/// @desc	Shows a notification
/// @param	{string} text
function Notification(_text) {
	with(oDebug) {
		array_push(notifications, {text: _text, alpha: 5});	
	}
}

/// @desc	Prints data to console
/// @param	{any} text
function print() {
	if (GM_build_type == "run") {
		var _text = $"[{global.frameNumber}] ";
		for(var i = 0; i < argument_count; i++) {
			_text += string(argument[i]);
			if (i != argument_count-1)
				_text += " ";
		}
		show_debug_message(_text);
	}
}

function PrintObjectProperties() {
	var _list = "";
	with(pElement) {
		var _vars = {};
		var _varNames = variable_instance_get_names(self);
		for(var i = 0; i < array_length(_varNames); i++) {
			_vars[$ _varNames[i]] = variable_instance_get(self, _varNames[i]);
			_vars[$ x] = x;
			_vars[$ y] = y;
			_vars[$ phy_position_x] = phy_position_x;
			_vars[$ phy_position_y] = phy_position_y;
			_vars[$ image_angle] = image_angle;
			_vars[$ phy_rotation] = phy_rotation;
		}
		
		_list += json_stringify( self);
	}
	
	print(global.frameNumber);
	print("Prev:", global.__tempElementList);
	print("-----------------");
	print("New:", _list);
	global.__tempElementList = _list;	
}