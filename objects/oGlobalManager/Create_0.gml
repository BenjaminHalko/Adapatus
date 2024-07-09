/// @desc Setup Game

surface_resize(application_surface, ResWidth, ResHeight);
window_set_size(ResWidth * 3, ResHeight * 3);

// Create GMLive
instance_create_depth(0, 0, 0, obj_gmlive);
room_set_live(rLevel, true);
live_blank_object = obj_blank_object;
live_blank_room = rm_blank_room;

room_goto_next();
