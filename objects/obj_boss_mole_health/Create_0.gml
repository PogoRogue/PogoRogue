/// @description Instantiate variables

view_height = camera_get_view_height(view_camera[0]);
view_x = camera_get_view_x(view_camera[0]);
view_y = camera_get_view_y(view_camera[0]);

parent = noone; //instance_nearest(x, y, obj_boss_sphere);
total_spaces = 192;
num_segments1 = 0;
num_segments2 = 0;
num_segments3 = 0;

fragments_num = 192;

temp_hp = 1;
temp_hp_max = 1;

x2 = x;
x3 = x;

depth = -200;