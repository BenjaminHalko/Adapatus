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