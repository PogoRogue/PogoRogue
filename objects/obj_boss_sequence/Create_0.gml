/// @description Instantiate variables and set up sequence

// Get reference to body object
body = instance_nearest(x, y, obj_boss_sequence_body);

// The complete list of states the boss can be in
enum BOSS2_STATES
{
	IDLE,
    ATTACKING,
    VULNERABLE,
    INACTIVE,
}

current_state = BOSS2_STATES.IDLE;
previous_state = noone;
state_has_changed = true;
fight_started = false;

/* Handle HP threshold percentiles to both determine sequence length and
 * trigger an early end to the vulnerability state
 *
 *  segment			 0        1        2
 *	sequence	[ len: 4 | len: 3 | len: 2 ]
 *	threshold	0%      33%      66%      100%
 */
hp_thresholds = [0, 33, 66];
current_hp_segment = 2;
previous_hp_segment = 2;
previous_hp_percent = 100;

sequence_length = 2;
sequence_increment_amount = 2;
current_sequence = scr_Generate_Sequence(sequence_length);
player_sequence = array_create(sequence_length, [-1]);
sequence_index = 0; // This index is used differently depending on the current state
sequence_failed = false;

// For controlling sprite frames
idle_pause_duration = room_speed * 1.3;
light_duration = room_speed;
blink_duration = room_speed / 2;
vulnerable_duration = room_speed * 16;
current_frame = 4;
image_speed = 0;

// Set up turret positions
turret_pos_1 = {x: 432, y: 416};
turret_pos_2 = {x: 672, y: 416};
axe_pos = {x: 560, y: 184};
slime_melee_pos = {x: 560, y: 416};

instance_create_layer(turret_pos_1.x, turret_pos_1.y, "enemies", obj_enemy_turret_unkillable);
instance_create_layer(turret_pos_2.x, turret_pos_2.y, "enemies", obj_enemy_turret_unkillable);
instance_create_layer(axe_pos.x, axe_pos.y, "enemies", obj_spikeswing, {distance: 120});

spawned = false;
white_alpha = 0;
