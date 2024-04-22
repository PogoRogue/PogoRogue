/// @description Instantiate variables and set up sequence

current_state = BOSS2_STATES.IDLE;
sequence_length = 2;
current_sequence = scr_Generate_Sequence(sequence_length);
player_sequence = array_create(sequence_length, [-1]);
sequence_index = 0;
sequence_failed = true;
is_done = false;

// For controlling sprite frames
idle_pause_duration = room_speed * 1.3;
light_duration = room_speed;
blink_duration = room_speed / 2;
current_frame = 2;
image_speed = 0;

//wall = instance_create_layer(498, 880, "ground", obj_ground, {image_xscale: 7.75, image_yscale: 1});

with(obj_electric_current) {
	is_active = false;
}
