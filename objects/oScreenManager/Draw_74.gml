/// @desc Draw Screen

shader_set(shColorPalette);
shader_set_uniform_f_array(global.uColorPaletteColors, global.colorPaletteColors[global.colorPalette]);
shader_set_uniform_f(global.uColorPaletteInvert, paletteInvertAmount);
draw_surface(application_surface, 0, 0);
shader_reset();

surface_set_target(global.guiSurface);
global.renderingGUI = true;
draw_clear_alpha(c_black, 0);
gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);