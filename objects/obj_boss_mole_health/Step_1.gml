/// @description Update segment count

if(!instance_exists(parent)) {
	//uncomment when boss object exists
	//instance_destroy(self);
	exit;
}

num_segments = floor((parent.hp / parent.hp_max) * total_spaces);

fragments_num += 2;