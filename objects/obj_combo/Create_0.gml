global.combo = 0;
global.combo_length = 0;
global.combo_max = 32;
combo_decrease_speed = global.combo_max/400; //# of frames for each combo to last

if (instance_exists(obj_player)) {
	depth = obj_player.depth - 1;
}