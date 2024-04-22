/// @description Instantiate variables

// Inherit the parent event
event_inherited();

// Get reference to boss controller
controller = instance_nearest(x, y, obj_boss_sequence);

// Health
draw_hp = false;
hp = 300;
hp_max = hp;
boss_name = "Slime Cooler";
hp_percent = (hp / hp_max) * 100;
view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
top_border = view_height - 20;

instance_create_depth(x, y, -20, obj_boss_sequence_health);

spawned = false;
white_alpha = 0;

explode = false;
red_alpha = 0;
