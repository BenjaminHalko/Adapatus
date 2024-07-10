/// @desc Draw Screen

shader_set(shColorPalette);
shader_set_uniform_f_array(global.uColorPaletteColors, global.colorPaletteColors[global.colorPalette]);
shader_set_uniform_f(global.uColorPaletteInvert, paletteInvertAmount);
draw_surface(application_surface, 0, 0);
shader_reset();
