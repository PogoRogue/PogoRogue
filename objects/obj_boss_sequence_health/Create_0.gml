/// @description Instantiate variables

view_height = camera_get_view_height(view_camera[0]);
view_x = camera_get_view_x(view_camera[0]);
view_y = camera_get_view_y(view_camera[0]);

controller = instance_nearest(x, y, obj_boss_sequence);
parent = instance_nearest(x, y, obj_boss_sequence_body);
total_spaces = 512;
num_segments = 0;

depth = -100;