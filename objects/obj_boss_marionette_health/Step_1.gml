/// @description Update segment count

if(!instance_exists(parent)) {
	instance_destroy(self);
	exit;
}

num_segments = floor((parent.hp / parent.hp_max) * total_spaces);
