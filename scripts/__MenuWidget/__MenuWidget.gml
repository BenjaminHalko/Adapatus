/// @desc	The base for the entire menu
function __MenuWidget() constructor {
	__x = 0;
	__y = 0;
	__xScale = 1;
	__yScale = 1;
	__alpha = 1;
	__width = 0;
	__height = 0;
	__baseWidth = 0;
	__baseHeight = 0;
	
	/// @param	{real} x
	/// @param	{real} y
	static Pos = function(_x, _y) {
		__x = _x;
		__y = _y;
		return self;
	}
	
	/// @param	{real} xscale
	/// @param	{real} [yscale]
	static Scale = function(_xscale, _yscale=undefined) {
		__xScale = _xscale;
		__yScale = is_undefined(_yscale) ? __xScale : _yscale;
		return self;
	}
	
	/// @param	{real} width
	static Width = function(_width) {
		__width = _width;
		return self;
	}
	
	/// @param	{real} width
	static Height = function(_height) {
		__height = _height;
		return self;
	}
	
	/// @param	{real} alpha
	static Alpha = function(_alpha) {
		__alpha = _alpha;
		return self;
	}
	
	
	
	Step = function(){};
	Draw = function(){};
}