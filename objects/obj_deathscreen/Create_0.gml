if instance_exists(obj_camera) {
	x = obj_camera.x;
	y = obj_camera.y - 600;
	obj_camera.follow = noone;
}

spd = 8;
spd_multiply = 1;
select_x = 0;
select_x_max = 2;
selected_x = false;
centered = false;
alpha = 0;
win = false;
win_stat_added = false;
best_time = false;

current_seed = global.seed;