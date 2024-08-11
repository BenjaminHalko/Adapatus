/// @desc Draw GUI

EnableLive;

global.renderingGUI = false;
surface_reset_target();
shader_set(shColorPalette);
shader_set_uniform_f_array(global.uColorPaletteColors, global.colorPaletteColors[global.colorPalette]);
if (global.transitionFade == 1)
	draw_surface(global.guiSurface, 0, 0);
else
	draw_surface_ext(global.guiSurface, 0, 0, 1, 1, 0, merge_color(c_black, c_white, global.transitionFade), min(global.transitionFade * 2, 1));
shader_reset();

if (!global.hasNativeCursor and MouseInWindow()) {
	var _mx = MouseGUIX();
	var _my = MouseGUIY();
	draw_sprite(global.cursors[global.currentCursorType], 0, _mx, _my);
}