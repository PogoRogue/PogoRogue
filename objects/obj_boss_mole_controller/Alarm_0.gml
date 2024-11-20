/// @description Poke

if instance_exists(mole_1) {
	if mole_1.state != mole_1.state_waiting or mole_1.megabounce_freeze = true {
		alarm[0] = 1;
		exit;
	}
}
if instance_exists(mole_2) {
	if mole_2.state != mole_2.state_waiting or mole_2.megabounce_freeze = true {
		alarm[0] = 1;
		exit;
	}
}
if instance_exists(mole_3) {
	if mole_3.state != mole_3.state_waiting or mole_3.megabounce_freeze = true {
		alarm[0] = 1;
		exit;
	}
}

random_set_seed(global.seed+global.mole_number);
var pipe1 = irandom_range(1,10);
var pipe2 = irandom_range(1,10);
var pipe3 = irandom_range(1,10);

var delay_length = 20;

while (pipe2 = pipe1) {
	var pipe2 = irandom_range(1,10);
}

while (pipe3 = pipe1) or (pipe3 = pipe2) {
	var pipe3 = irandom_range(1,10);
}

next_state_array = [];

for(i = 0; i < poke_odds; i++) {
	array_resize(next_state_array,array_length(next_state_array)+1)
	next_state_array[array_length(next_state_array)-1] = "poke";
}

for(i = 0; i < shoot_odds; i++) {
	array_resize(next_state_array,array_length(next_state_array)+1)
	next_state_array[array_length(next_state_array)-1] = "shoot";
}

for(i = 0; i < jump_odds; i++) {
	array_resize(next_state_array,array_length(next_state_array)+1)
	next_state_array[array_length(next_state_array)-1] = "jump";
}

var random_array_value = irandom_range(0,array_length(next_state_array)-1);

next_state = next_state_array[random_array_value]; //choose("poke","poke","shoot","jump");

/*if next_state = "poke" {
	times_in_a_row += 1;
}else {
	times_in_a_row = 0;
}

if times_in_a_row >= 3 {
	next_state = choose("shoot","jump");
}*/

//shoot next
if next_state = "shoot" {
	shoot_vertical = choose(true,false);
	
	if shoot_vertical = true {
		if current_moles_left = 3 { //3 moles left
			var positioning = irandom_range(1,6);
			if positioning = 1 {
				pipe1 = 1;
				pipe2 = 7;
				pipe3 = 3;
			}
			if positioning = 2 {
				pipe1 = 8;
				pipe2 = 2;
				pipe3 = 6;
			}
			if positioning = 3 {
				pipe1 = 8;
				pipe2 = 7;
				pipe3 = 6;
			}
			if positioning = 4 {
				pipe1 = 3;
				pipe2 = 7;
				pipe3 = 1;
			}
			if positioning = 5 {
				pipe1 = 6;
				pipe2 = 2;
				pipe3 = 8;
			}
			if positioning = 6 {
				pipe1 = 6;
				pipe2 = 7;
				pipe3 = 8;
			}
		}else if current_moles_left = 2 { //2 moles left
			
			var temp_pipe1 = 1;
			var temp_pipe2 = 1;
			var positioning = irandom_range(1,9);
				
			if positioning = 1 {
				temp_pipe1 = 1;
				temp_pipe2 = 7;
			}else if positioning = 2 {
				temp_pipe1 = 2;
				temp_pipe2 = 8;
			}else if positioning = 3 {
				temp_pipe1 = 6;
				temp_pipe2 = 2;
			}else if positioning = 4 {
				temp_pipe1 = 7;
				temp_pipe2 = 3;
			}else if positioning = 5 {
				temp_pipe1 = 1;
				temp_pipe2 = 6;
			}else if positioning = 6 {
				temp_pipe1 = 8;
				temp_pipe2 = 3;
			}else if positioning = 7 {
				temp_pipe1 = 8;
				temp_pipe2 = 7;
			}else if positioning = 8 {
				temp_pipe1 = 6;
				temp_pipe2 = 7;
			}else if positioning = 9 {
				temp_pipe1 = 8;
				temp_pipe2 = 6;
			}
			
			if instance_exists(obj_boss_mole1) {
				pipe1 = temp_pipe1;
			}else {
				pipe2 = temp_pipe1;
			}
			
			if instance_exists(obj_boss_mole2) {
				if instance_exists(obj_boss_mole1) {
					pipe2 = temp_pipe2;
				}
			}else {
				pipe3 = temp_pipe2;
			}
		}else if current_moles_left = 1 { //1 mole left
			var positioning = choose(1,2,3,6,7,8);
			
			if instance_exists(obj_boss_mole1) {
				pipe1 = positioning;
			}
			if instance_exists(obj_boss_mole2) {
				pipe2 = positioning;
			}
			if instance_exists(obj_boss_mole3) {
				pipe3 = positioning;
			}
		}
	}else { //horizontal
		if current_moles_left = 3 {
			var positioning = irandom_range(1,4);
			if positioning = 1 {
				pipe1 = 10;
				pipe2 = 5;
				pipe3 = 10;
			}
			if positioning = 2 {
				pipe1 = 9;
				pipe2 = 4;
				pipe3 = 9;
			}
			if positioning = 3 {
				pipe1 = 5;
				pipe2 = 10;
				pipe3 = 5;
			}
			if positioning = 4 {
				pipe1 = 4;
				pipe2 = 9;
				pipe3 = 4;
			}
		}else if current_moles_left = 2 {
			var temp_pipe1 = 1;
			var temp_pipe2 = 1;
			var positioning = irandom_range(1,4);
			
			if positioning = 1 {
				temp_pipe1 = 10;
				temp_pipe2 = 5;
			}else if positioning = 2 {
				temp_pipe1 = 9;
				temp_pipe2 = 4;
			}else if positioning = 3 {
				temp_pipe1 = 5;
				temp_pipe2 = 10;
			}else if positioning = 4 {
				temp_pipe1 = 4;
				temp_pipe2 = 9;
			}
			
			if instance_exists(obj_boss_mole1) {
				pipe1 = temp_pipe1;
			}else {
				pipe2 = temp_pipe1;
			}
			
			if instance_exists(obj_boss_mole2) {
				if instance_exists(obj_boss_mole1) {
					pipe2 = temp_pipe2;
				}else {
					pipe2 = temp_pipe1;
					pipe3 = temp_pipe2;
				}
			}else {
				pipe3 = temp_pipe2;
			}
		}else if current_moles_left = 1 {
			var positioning = choose(4,5,9,10);
			
			if instance_exists(obj_boss_mole1) {
				pipe1 = positioning;
			}
			if instance_exists(obj_boss_mole2) {
				pipe2 = positioning;
			}
			if instance_exists(obj_boss_mole3) {
				pipe3 = positioning;
			}
		}
	}
}

//jump next
if next_state = "jump" {
	if current_moles_left = 3 {
		var positioning = irandom_range(1,6);
		if positioning = 1 {
			pipe1 = 1;
			pipe2 = 2;
			pipe3 = 3;
		}else if positioning = 2 {
			pipe1 = 1;
			pipe2 = 3;
			pipe3 = 2;
		}else if positioning = 3 {
			pipe1 = 2;
			pipe2 = 1;
			pipe3 = 3;
		}else if positioning = 4 {
			pipe1 = 2;
			pipe2 = 3;
			pipe3 = 1;
		}else if positioning = 5 {
			pipe1 = 3;
			pipe2 = 2;
			pipe3 = 1;
		}else if positioning = 6 {
			pipe1 = 3;
			pipe2 = 1;
			pipe3 = 2;
		}
	}else if current_moles_left = 2 {
		var temp_pipe1 = 1;
		var temp_pipe2 = 1;
		var positioning = irandom_range(1,6);
			
		if positioning = 1 {
			temp_pipe1 = 1;
			temp_pipe2 = 2;
		}else if positioning = 2 {
			temp_pipe1 = 1;
			temp_pipe2 = 3;
		}else if positioning = 3 {
			temp_pipe1 = 2;
			temp_pipe2 = 1;
		}else if positioning = 4 {
			temp_pipe1 = 3;
			temp_pipe2 = 1;
		}else if positioning = 5 {
			temp_pipe1 = 2;
			temp_pipe2 = 3;
		}else if positioning = 6 {
			temp_pipe1 = 3;
			temp_pipe2 = 2;
		}
			
		if instance_exists(obj_boss_mole1) {
			pipe1 = temp_pipe1;
		}else {
			pipe2 = temp_pipe1;
		}
			
		if instance_exists(obj_boss_mole2) {
			if instance_exists(obj_boss_mole1) {
				pipe2 = temp_pipe2;
			}else {
				pipe2 = temp_pipe1;
				pipe3 = temp_pipe2;
			}
		}else {
			pipe3 = temp_pipe2;
		}
	}else if current_moles_left = 1 {
		var positioning = choose(1,2,3);
			
		if instance_exists(obj_boss_mole1) {
			pipe1 = positioning;
		}
		if instance_exists(obj_boss_mole2) {
			pipe2 = positioning;
		}
		if instance_exists(obj_boss_mole3) {
			pipe3 = positioning;
		}
	}
}

if next_state = "poke" and current_moles_left = 3 {
	if pipe1 = 6 and pipe3 = 3 {
		if pipe2 != 7 {
			pipe1 = 7;
		}else {
			pipe1 = 8;
		}
	}else if pipe1 = 7 and pipe3 = 2 {
		if pipe2 != 8 {
			pipe1 = 8;
		}else {
			pipe1 = 6;
		}
	}else if pipe1 = 8 and pipe3 = 1 {
		if pipe2 != 6 {
			pipe1 = 6;
		}else {
			pipe1 = 7;
		}
	}
}

var bomb_odds = 0;
var mole_bomb_num = 0;

//bomb odds
if next_state = "poke" {
	bomb_odds = irandom_range(1,bomb_max_odds);
	if bomb_odds = 1 {
		mole_bomb_num = irandom_range(1,3);
		if mole_bomb_num = 1 {
			if instance_exists(mole_1) {
				mole_1.is_bomb = true;
				mole_1.image_speed = 0;
				mole_1.alarm[6] = mole_1.pause_time_poke;
				mole_1.current_bomb_hp = mole_1.hp;
				bomb_max_odds = 4;
			}else {
				mole_bomb_num = 2;
			}
		}
		if mole_bomb_num = 2 {
			if instance_exists(mole_2) {
				mole_2.is_bomb = true;
				mole_2.image_speed = 0;
				mole_2.alarm[6] = mole_2.pause_time_poke;
				mole_2.current_bomb_hp = mole_2.hp;
				bomb_max_odds = 4;
			}else {
				mole_bomb_num = 3;
			}
		}
		if mole_bomb_num = 3 {
			if instance_exists(mole_3) {
				mole_3.is_bomb = true;
				mole_3.image_speed = 0;
				mole_3.alarm[6] = mole_3.pause_time_poke;
				mole_3.current_bomb_hp = mole_3.hp;
				bomb_max_odds = 4;
			}else {
				bomb_max_odds = 1;
			}
		}
	}else {
		if bomb_max_odds > 1 {
			bomb_max_odds -= 1;	
		}
	}
}

if instance_exists(mole_1) {
	mole_1.state = mole_1.state_poke;
	mole_1.delay = 0;
	mole_1.state_switched = true;
	scr_Move_To_Pipe(mole_1,pipe1);
	if next_state = "poke" {
		mole_1.can_fall = true;
	}else {
		mole_1.can_fall = false;
	}
	//audio_play_sound(snd_mole_pokeup,0,false);	
}

if instance_exists(mole_2) {
	mole_2.state = mole_2.state_poke;
	mole_2.delay = delay_length - (delay_length * !instance_exists(mole_1));
	mole_2.state_switched = true;
	scr_Move_To_Pipe(mole_2,pipe2);
	if next_state = "poke" {
		mole_2.can_fall = true;
	}else {
		mole_2.can_fall = false;
	}
	
	if pipe2 = pipe1 and instance_exists(obj_boss_mole1) {
		mole_2.state_switched = true;
		mole_2.state = mole_2.state_waiting;
	}
}

if instance_exists(mole_3) {
	mole_3.state = mole_3.state_poke;
	mole_3.delay = (delay_length*2) - (delay_length * !instance_exists(mole_1)) - (delay_length * !instance_exists(mole_2));
	mole_3.state_switched = true;
	scr_Move_To_Pipe(mole_3,pipe3);
	if next_state = "poke" {
		mole_3.can_fall = true;
	}else {
		mole_3.can_fall = false;
	}
	
	if pipe3 = pipe1 and instance_exists(obj_boss_mole1)
	or pipe3 = pipe2 and instance_exists(obj_boss_mole2) {
		mole_3.state_switched = true;
		mole_3.state = mole_3.state_waiting;
	}
}

next_pipe1 = pipe1;
next_pipe2 = pipe2;
next_pipe3 = pipe3;

global.mole_number += 1;

if next_state = "poke" {
	alarm[0] = time_between_attacks - ((3-current_moles_left)*30);
	poke_odds -= 1;
	var jump = choose(true,false);
	if jump = true {
		jump_odds += 1;
	}else {
		shoot_odds += 1;
	}
}else if next_state = "shoot" {
	alarm[1] = time_between_attacks - ((3-current_moles_left)*30);
	poke_odds += 1;
	jump_odds += 1;
	shoot_odds -= 2;
}else if next_state = "jump" {
	alarm[2] = time_between_attacks - ((3-current_moles_left)*30);
	poke_odds += 1;
	shoot_odds += 1;
	jump_odds -= 2;
}

if poke_odds < 0 {
	poke_odds = 0;
}

if shoot_odds < 0 {
	shoot_odds = 0;
}

if jump_odds < 0 {
	jump_odds = 0;
}

random_set_seed(global.seed);