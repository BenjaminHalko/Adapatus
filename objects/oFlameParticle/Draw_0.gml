/// @desc Draw Flame

draw_set_color(c_white);

var _size = size * percent;

draw_primitive_begin(pr_trianglestrip);

draw_vertex(x+_size, y);
draw_vertex(x, y-_size/2);
draw_vertex(x, y+_size/2);
draw_vertex(x-_size, y);

draw_primitive_end();