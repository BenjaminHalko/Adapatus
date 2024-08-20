/// @desc Draw Flame

draw_set_color(c_white);

draw_primitive_begin(pr_trianglestrip);

draw_vertex(x+size, y);
draw_vertex(x, y-size/2);
draw_vertex(x, y+size/2);
draw_vertex(x-size, y);

draw_primitive_end();