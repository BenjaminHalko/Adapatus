/// @desc	Basic Config for Scribble
function ScribbleConfig() {
	scribble_font_set_default("fFont");	
}

/// @desc	Applies default config to scribble
/// @param	{string} text
function ScribbleExt(_text) {
	return scribble(_text);
}


/// @desc	Gets width of string
/// @param	{string} text
/// @param	{real} width
function StringWidth(_text, _width=-1) {
	var _scribble = scribble(_text);
	if (_width != -1)
		_scribble = _scribble.wrap(_width);
	return string_width_scribble(_text);
}