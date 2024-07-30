/// @desc Draw Window

EnableLive;

draw_set_color(c_black);
draw_set_alpha(max(bgAlpha-0.6, 0));
draw_rectangle(0, 0, ResWidth, ResHeight, false);
draw_set_alpha(1);

menus[0].Alpha(alpha).Draw();