/// }@description Instantiate variables

boss = instance_nearest(x, y, obj_boss_marionette);
parent = instance_nearest(x, y, obj_boss_marionette_arm);
target = instance_nearest(x, y, obj_player);

weapon_x = x + lengthdir_x(48, image_angle);
weapon_y = y + lengthdir_y(48, image_angle);

cooldown = room_speed * 7;
alarm_set(1, cooldown * 2);
draw_laser = false;

// If this is the second arm, offset the cooldown
if(arm_num == 1) {
	alarm_set(1, cooldown * 3.5);
}

player = instance_find(obj_player, 0);

initial_depth = depth;
