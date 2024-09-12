depth -= 1000;

center_x = camera_get_view_width(view_camera[0])/2;
center_y = camera_get_view_height(view_camera[0])/2;

moving_in = true;
centered = false;
spd = 16;
spd2 = 0;
spd_multiply = 1;
target_x = camera_get_view_width(view_camera[0])/2;
alpha = 1.25;
fade_away = false;

x = -(camera_get_view_width(view_camera[0])/4);
y = center_y-100;
split_time = global.new_best_split;