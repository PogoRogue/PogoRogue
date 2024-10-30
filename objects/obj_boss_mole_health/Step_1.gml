/// @description Update segment count

if(!instance_exists(obj_boss_mole_parent)) {
	instance_destroy(self);
	exit;
}

if instance_exists(obj_boss_mole1) {
	num_segments1 = floor((obj_boss_mole1.hp / obj_boss_mole1.hp_max) * total_spaces);
}
if instance_exists(obj_boss_mole2) {
	num_segments2 = floor((obj_boss_mole2.hp / obj_boss_mole2.hp_max) * total_spaces);
}
if instance_exists(obj_boss_mole3) {
	num_segments3 = floor((obj_boss_mole3.hp / obj_boss_mole3.hp_max) * total_spaces);
}


//fragments_num += 2;