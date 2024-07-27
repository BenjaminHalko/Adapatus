/// @desc Draw Screen

surface_set_target(global.guiSurface);
global.renderingGUI = true;
draw_surface(application_surface, 0, 0);
gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);