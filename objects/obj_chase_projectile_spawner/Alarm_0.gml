/// @description Set a new position

random_set_seed(global.seed + projectiles_created);
spawn_x = irandom(view_width - 96) + 48;
random_set_seed(global.seed);

instance_create_layer(spawn_x, -100, "enemies", obj_projectile_warning);
projectiles_created++;
alarm_set(1, warning_delay);
