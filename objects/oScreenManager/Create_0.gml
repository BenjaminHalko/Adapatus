/// @desc Setup Resolution

// Resolution
surface_resize(application_surface, ResWidth, ResHeight);
window_set_size(ResWidth * 3, ResHeight * 3);
window_center();

// Surface
application_surface_draw_enable(false);

// Color Palette
paletteInvertAmount = 0;
