/// @description Instantiate variables and set up sequence

// Get reference to body object
body = instance_nearest(x, y, obj_boss_sequence_body);

// The complete list of states the boss can be in
enum STATES
{
	IDLE,
    ATTACKING,
    VULNERABLE,
    DEAD,
}

current_state = STATES.IDLE;
previous_state = noone;
state_has_changed = true;

// These are the colors that sequences will be comprised of
enum COLORS
{
	PURPLE = #CF8ACB,
	ORANGE = #D3A068,
	CYAN = #A2DCC7,
	YELLOW = #C2D368,
}

colors = [COLORS.PURPLE, COLORS.ORANGE, COLORS.CYAN, COLORS.YELLOW];

sequence_length = 2;
sequence_increment_amount = 2;
current_sequence = scr_Generate_Sequence(sequence_length);
player_sequence = array_create(sequence_length, [-1]);
sequence_index = 0; // This index is used differently depending on the current state

// For controlling sprite frames
light_duration = room_speed;
blink_duration = room_speed / 2;
current_frame = 4;
image_speed = 0;

// Set up turret positions
turret_pos_1 = {x: 432, y: 416};
turret_pos_2 = {x: 672, y: 416};
axe_pos = {x: 560, y: 184};
