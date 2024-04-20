/// @description Instantiate variables

current_angle = start_angle;
collision_range = camera_get_view_width(view_camera[0]) * 6;
draw_range = 0;
angle_increment = (end_angle - start_angle) / (duration * room_speed);
damage = 8;
parent = noone;

end_x = x;
end_y = y;

color_1 = #212123;
color_2 = #4B80CA;
color_3 = #68C2D3;
color_4 = #A2DCC7;
color_5 = #F2F0E5;

alarm_set(0, duration * room_speed);
