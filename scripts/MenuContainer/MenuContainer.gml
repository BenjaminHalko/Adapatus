/// @param	{array<array<struct.__MenuWidget>>} widgets
/// @param	{Asset.GMSprite} sprite
function MenuContainer(_widgets, _sprite) {
	return new __MenuContainer(_widgets, _sprite)	
}

/// @param	{array<array<struct.__MenuWidget>>} widgets
/// @param	{Asset.GMSprite} sprite
function __MenuContainer(_widgets, _sprite) : __MenuWidget() constructor {
	__widgets = _widgets;
	__sprite = _sprite;
	__xOffset = sprite_get_xoffset(__sprite);
	__yOffset = sprite_get_yoffset(__sprite);
	__baseWidth = sprite_get_width(__sprite);
	__baseHeight = sprite_get_height(__sprite);
	__width = 0;
	__height = 0;
	__paddingX = 0;
	__paddingY = 0;
	__gapX = 0;
	__gapY = 0;
	
	__gapXScale = 1;
	__gapYScale = 1;
	
	__uniformWidth = false;
	
	__dimensionsDirty = true;
	
	static CalculateSize = function() {
		if (!__dimensionsDirty)
			return;
			
		var _numRows = array_length(__widgets);
		var _rowSizes = array_create(_numRows);
		var _minHeight = 0;
		__width = 0;
		__height = (_numRows - 1) * __gapY * __gapYScale;

		// Check Size
		for (var i = 0; i < _numRows; i++) {
			var _row = __widgets[i];
			var _numCols = array_length(_row);
			var _width = (_numCols - 1) * __gapX * __gapXScale;
			var _minWidth = 0;
			var _height = 0;
			
			for (var j = 0; j < _numCols; j++) {
				var _widget = _row[j];
				_width += _widget.__width * __gapXScale;
				_minWidth = max(_widget.__width, _minWidth);
				_height = max(_widget.__height, _height);
			}
			
			_width = max(_width, _minWidth);
			
			_rowSizes[i] = {
				width: _width,
				height: _height
			};
			
			__width = max(_width, __width);
			
			_minHeight = max(_minHeight, _height);
			__height += _height * __gapYScale;
		}
		
		__height = max(__height, _minHeight);
		
		// Re Position
		var _posY = 0;
		switch(__valign) {
			case fa_top:
				_posY = __paddingY;
			break;
			case fa_middle:
				_posY = - round(__height / 2);
			break;
			case fa_bottom:
				_posY = - __height - __paddingY;
			break;
		}
		
		for (var i = 0; i < _numRows; i++) {
			var _row = __widgets[i];
			var _rowSize = _rowSizes[i];
			var _numCols = array_length(_row);
			var _posX = 0;
			var _width = _rowSize.width;
			var _uniformWidth = false;
			
			if (is_array(__uniformWidth)) {
				if (__uniformWidth[i]) {
					_width = __width;
					_uniformWidth = true;
				}
			} else if (__uniformWidth) {
				_width = __width;
				_uniformWidth = true;
			}
			
			switch(__halign) {
				case fa_left:
					_posX = __paddingX
				break;
				case fa_center:
					_posX = - round(_width / 2);
				break;
				case fa_right:
					_posX = - _width - __paddingX;
				break;
			}
			
			for (var j = 0; j < _numCols; j++) {
				var _widget = _row[j];
				_widget.__windowOffsetX = _posX;
				_widget.__windowOffsetY = _posY;
				if (_uniformWidth)
					_posX += (_width / _numCols) * __gapXScale;
				else
					_posX += (_widget.__width + __gapX) * __gapXScale;
			}
			
			_posY += (_rowSize.height + __gapY) * __gapYScale;
		}
		
		__width += __paddingX * 2;
		__height += __paddingY * 2;
		
		__dimensionsDirty = false;
	}
	
	/// @param	{real} x
	/// @param	{real} y
	static Padding = function(_x, _y) {
		__paddingX = _x;
		__paddingY = _y;
		__dimensionsDirty = true;
		return self;
	}
	
	/// @param	{real} x
	/// @param	{real} y
	static Gap = function(_x, _y) {
		__gapX = _x;
		__gapY = _y;
		__dimensionsDirty = true;
		return self;
	}
	
	/// @param	{real} x
	/// @param	{real} y
	static GapScale = function(_x, _y) {
		__gapXScale = _x;
		__gapYScale = _y;
		__dimensionsDirty = true;
		return self;
	}
	
	/// @param	{array<array<struct.__MenuWidget>>} widgets
	static Widgets = function(_widgets) {
		__widgets = _widgets;
		__dimensionsDirty = true;
		return self;
	}
	
	/// @param	{Constant.HAlign} halign
	/// @param	{Constant.VAlign} valign
	static Align = function(_halign, _valign) {
		__halign = _halign;
		__valign = _valign;
		__dimensionsDirty = true;
		return self;
	}
	
	/// @param	{bool|array<bool>} uniformWidth
	static UniformWidth = function(_uniformWidth) {
		__uniformWidth = _uniformWidth;
		__dimensionsDirty = true;
		return self;
	}	
	
	Step = function() {
		// Recalculate size if needed
		CalculateSize();
		
		// Step all widgets
		var _numRows = array_length(__widgets);
		for (var i = 0; i < _numRows; i++) {
			var _row = __widgets[i];
			var _numCols = array_length(_row);
			for (var j = 0; j < _numCols; j++) {
				var _widget = _row[j];
				_widget.Pos(
					_widget.__windowOffsetX * __xScale + __x,
					_widget.__windowOffsetY * __yScale + __y
				).Step();
			}
		}
	}
	
	Draw = function() {
		// Recalculate size if needed
		CalculateSize();
		
		// Draw Sprite
		var _xScale = round(__xScale * __width / 2) / __baseWidth * 2;
		var _yScale = round(__yScale * __height / 2) / __baseHeight * 2;
		draw_sprite_ext(__sprite, 0, __x, __y, _xScale, _yScale, 0, c_white, __alpha);
		
		// Draw all widgets
		var _numRows = array_length(__widgets);
		for (var i = 0; i < _numRows; i++) {
			var _row = __widgets[i];
			var _numCols = array_length(_row);
			for (var j = 0; j < _numCols; j++) {
				var _widget = _row[j];
				_widget.Alpha(__alpha).Draw();
			}
		}
	}
}