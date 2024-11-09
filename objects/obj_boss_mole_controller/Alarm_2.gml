/// @description jump

if instance_exists(mole_1) {
	if mole_1.state != mole_1.state_waiting or mole_1.megabounce_freeze = true {
		alarm[2] = 1;
		exit;
	}
}
if instance_exists(mole_2) {
	if mole_2.state != mole_2.state_waiting or mole_2.megabounce_freeze = true {
		alarm[2] = 1;
		exit;
	}
}
if instance_exists(mole_3) {
	if mole_3.state != mole_3.state_waiting or mole_3.megabounce_freeze = true {
		alarm[2] = 1;
		exit;
	}
}

random_set_seed(global.seed+global.mole_number);

var pipe1 = next_pipe1;
var pipe2 = next_pipe2;
var pipe3 = next_pipe3;

var delay_length = 45;

if instance_exists(mole_1) {
	mole_1.state = mole_1.state_jump;
	mole_1.delay = 0;
	mole_1.state_switched = true;
	scr_Move_To_Pipe(mole_1,pipe1);
}
if instance_exists(mole_2) {
	mole_2.state = mole_2.state_jump;
	mole_2.delay = delay_length - (delay_length * !instance_exists(mole_1));
	mole_2.state_switched = true;
	scr_Move_To_Pipe(mole_2,pipe2);
}
if instance_exists(mole_3) {
	mole_3.state = mole_3.state_jump;
	mole_3.delay = delay_length*2 - (delay_length * !instance_exists(mole_1)) - (delay_length * !instance_exists(mole_2));
	mole_3.state_switched = true;
	scr_Move_To_Pipe(mole_3,pipe3);
}

global.mole_number += 1;
alarm[0] = time_between_attacks - ((3-current_moles_left)*60);

random_set_seed(global.seed);