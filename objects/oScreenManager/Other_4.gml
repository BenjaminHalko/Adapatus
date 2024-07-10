/// @desc Setup Surface

var _startLayer = "Entities";
var _endLayer = _startLayer;

layer_script_begin(_startLayer, function() {
	if (!surface_exists(global.shadowSurface))
		global.shadowSurface = surface_create(ResWidth, ResHeight);
	surface_set_target(global.shadowSurface);
	draw_clear_alpha(c_black, 0);
});

layer_script_end(_endLayer, function() {
	surface_reset_target();
	draw_surface_ext(global.shadowSurface, 2, 2, 1, 1, 0, c_black, 1);
	draw_surface(global.shadowSurface, 0, 0);
});