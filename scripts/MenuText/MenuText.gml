/// @param	{string} text
function MenuText(_text) {
	return new __MenuText(_text);	
}

/// @param	{string} text
function __MenuText(_text) : __MenuWidget() constructor {
	__text = _text;
	__width = 0;
	__height = 0;
	
	/// @param	{string} text
	static Text = function(_text) {
		__text = _text;
		__width = StringWidth(_text);
		__height = StringHeight(_text);
		return self;
	}
	
	Draw = function() {
		ScribbleExt(__text).align(fa_left, fa_middle).blend(c_white, __alpha).draw(__x, __y);	
	}
	
	Text(__text);
}