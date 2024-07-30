/// @desc	The base for a menu button
/// @param	{Asset.GMSprite} sprite
function MenuButton(_sprite) : __MenuWidget() constructor {
	// Setup Sprite
	__sprite = _sprite;
	__xOffset = sprite_get_xoffset(__sprite);
	__yOffset = sprite_get_yoffset(__sprite);
	__baseWidth = sprite_get_width(__sprite);
	__baseHeight = sprite_get_height(__sprite);
	__width = __baseWidth;
	__height = __baseHeight;
	__bboxLeft = 0;
	__bboxRight = 0;
	__bboxTop = 0;
	__bboxBottom = 0;
	
	// More Calculations
	__isHovered = false;
	__fixScale = true;
	
	static CheckIfHovered = function() {
		var _mx = MouseGUIX();
		var _my = MouseGUIY();
		var _bboxScaleX = __width / __baseWidth;
		var _bboxScaleY = __height / __baseHeight;
		var _x0 = __x - __xOffset * _bboxScaleX;
		var _y0 = __y - __yOffset * _bboxScaleY;
		var _x1 = _x0 + __bboxLeft;
		var _y1 = _y0 + __bboxTop;
		var _x2 = _x0 + __width - __bboxRight;
		var _y2 = _y0 + __height - __bboxBottom;
		__isHovered = point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2);
		
		if (__isHovered and mouse_check_button_pressed(mb_left))
			script_execute_ext(__onClick, __onClickArgs);
	}
	
	static DrawButton = function() {
		var _fixScaleAmount = __fixScale ? 2 : 1;
		var _xScale = round(__xScale * __width / _fixScaleAmount) * _fixScaleAmount / __baseWidth;
		var _yScale = round(__yScale * __height / _fixScaleAmount) * _fixScaleAmount / __baseHeight;
		if (__isHovered) {
			var _borderAlpha = max(0, __alpha * 2 - 1);
			
			shader_set(shWhite);
			draw_sprite_ext(__sprite, 0, __x+2, __y, _xScale, _yScale, 0, c_white, _borderAlpha);
			draw_sprite_ext(__sprite, 0, __x-2, __y, _xScale, _yScale, 0, c_white, _borderAlpha);
			draw_sprite_ext(__sprite, 0, __x, __y+2, _xScale, _yScale, 0, c_white, _borderAlpha);
			draw_sprite_ext(__sprite, 0, __x, __y-2, _xScale, _yScale, 0, c_white, _borderAlpha);
			shader_reset();
			
			draw_sprite_ext(__sprite, 0, __x+1, __y, _xScale, _yScale, 0, c_black, _borderAlpha);
			draw_sprite_ext(__sprite, 0, __x-1, __y, _xScale, _yScale, 0, c_black, _borderAlpha);
			draw_sprite_ext(__sprite, 0, __x, __y+1, _xScale, _yScale, 0, c_black, _borderAlpha);
			draw_sprite_ext(__sprite, 0, __x, __y-1, _xScale, _yScale, 0, c_black, _borderAlpha);
		}
		
		draw_sprite_ext(__sprite, 0, __x, __y, _xScale, _yScale, 0, c_white, __alpha);
	}
	
	// Config for later
	__onClick = function(){};
	__onClickArgs = [];
}