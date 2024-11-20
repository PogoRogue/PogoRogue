/// @description Instantiate variables

view_height = camera_get_view_height(view_camera[0]);
view_x = camera_get_view_x(view_camera[0]);
view_y = camera_get_view_y(view_camera[0]);

//parent = instance_nearest(x, y, obj_boss_sphere);
total_spaces = 512;
num_segments = 0;

fragments_num = 512;

current_health = global.max_ball_health;

view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
top_border = view_height - 20;
depth = -500;