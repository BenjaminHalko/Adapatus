enum COLOR_TYPE {
	SHADOW,
	DARK,
	MID,
	LIGHT
}

global.renderingGUI = false;
global.guiSurface = undefined;

#macro surface_set_target_base surface_set_target
#macro surface_set_target surface_set_target_hook

#macro surface_reset_target_base surface_reset_target
#macro surface_reset_target surface_reset_target_hook

function surface_set_target_hook(_surface) {
	if (global.renderingGUI)
		surface_reset_target_base();
	surface_set_target_base(_surface);
}

function surface_reset_target_hook() {
	surface_reset_target_base();
	if (global.renderingGUI)
		surface_set_target_base(global.guiSurface);
}

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