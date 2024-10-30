/// @description Poke



random_set_seed(global.seed+global.mole_number);
var pipe1 = irandom_range(1,10);
var pipe2 = irandom_range(1,10);
var pipe3 = irandom_range(1,10);

while (pipe2 = pipe1) {
	var pipe2 = irandom_range(1,10);
}

while (pipe3 = pipe1) or (pipe3 = pipe2) {
	var pipe3 = irandom_range(1,10);
}

if instance_exists(mole_1) {
	mole_1.state = mole_1.state_poke;
	mole_1.delay = 0;
	mole_1.state_switched = true;
	scr_Move_To_Pipe(mole_1,pipe1);
}
if instance_exists(mole_2) {
	mole_2.state = mole_2.state_poke;
	mole_2.delay = 30;
	mole_2.state_switched = true;
	scr_Move_To_Pipe(mole_2,pipe2);
}
if instance_exists(mole_3) {
	mole_3.state = mole_3.state_poke;
	mole_3.delay = 60;
	mole_3.state_switched = true;
	scr_Move_To_Pipe(mole_3,pipe3);
}

global.mole_number += 1;
alarm[0] = 300;