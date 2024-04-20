/// @description Instantiate variables

// Timers
warning_delay = 2 * room_speed;
projectile_delay = 1 * room_speed;

// Get reference to boss
controller = instance_nearest(x, y, obj_boss_marionette_controller);

projectiles_created = 0; // Used to modify the seed each spawn
view_width = camera_get_view_width(view_camera[0]);
spawn_x = 0;
laser_toggle = 0;

// Initiate cycle
alarm_set(0, projectile_delay);
