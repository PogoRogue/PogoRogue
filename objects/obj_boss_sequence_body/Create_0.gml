/// @description Instantiate variables

// Inherit the parent event
event_inherited();

// Get reference to boss controller
controller = instance_nearest(x, y, obj_boss_sequence);

// Healthbar dimensions
draw_hp = false;
hp = 300;
hp_max = hp;
view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
left_border = 100;
top_border = view_height - 20;
right_border = view_width - 100;
bottom_border = view_height - 15;
segment_length = (right_border - left_border) / 3;
left_segment = left_border + segment_length;
right_segment = left_border + (2 * segment_length);

var _x1 = left_border + ((right_border - left_border) / 3);
var _x2 = left_border + (2 * (right_border - left_border) / 3);

hp_percent = (hp / hp_max) * 100;

hp_color_vulnerable = #B45252;
hp_color_invulnerable = #4C3535;