/// @desc Converts a set of colors to an array
/// @param {Constant.Color} shadow
/// @param {Constant.Color} dark
/// @param {Constant.Color} mid
/// @param {Constant.Color} light
/// @return {array<real>}
function PaletteToArray(_shadow, _dark, _mid, _light) {
	var _arrayOfColors = [_shadow, _dark, _mid, _light];
	var _output = [];
	for(var i = 0; i < 4; i++) {
		array_push(_output,
			color_get_red(_arrayOfColors[i]) / 255,
			color_get_green(_arrayOfColors[i]) / 255,
			color_get_blue(_arrayOfColors[i]) / 255
		);
	}
	return _output;
}