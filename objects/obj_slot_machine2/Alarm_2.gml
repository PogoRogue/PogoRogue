//spin
item1_y = 0;
item2_y = 0;
item3_y = 0;
randomize();
if num_of_spins > 0 {
	//item 1
	if num_of_spins > 21 and current_slot_hacking <= 1 {
		if item1_index < array_length(item1_array)-1 {
			item1_index += 1;
		}else {
			item1_index = 0;
		}
		item1 = item1_array[item1_index];
		if num_of_spins = 22 {
			item1_locked = true;	
			audio_play_sound(snd_slotmachine_stop,0,false);
		}
	}
	//item 2
	if num_of_spins > 15 and current_slot_hacking <= 2 {
		if item2_index < array_length(item2_array)-1 {
			item2_index += 1;
		}else {
			item2_index = 0;
		}
		item2 = item2_array[item2_index];
		
		if num_of_spins = 16 and !(win = true or twoinarow = true) and item2_locked = false {
			item2_locked = true;	
			audio_play_sound(snd_slotmachine_stop,0,false);
		}
	}else if current_slot_hacking <= 2 {
		item2 = item2_array[item2_index];
		if win = true or twoinarow = true {
			if item2 != item1 {
				if item2_index < array_length(item2_array)-1 {
					item2_index += 1;
				}else {
					item2_index = 0;
				}
				item2 = item2_array[item2_index];
			}
			if item2 = item1 and item2_locked = false {
				item2_locked = true;
				audio_play_sound(snd_slotmachine_stop,0,false);
			}
		}else {
			if item2_locked = false {
				item2_locked = true;
				audio_play_sound(snd_slotmachine_stop,0,false);
			}
		}
	}
	//item 3
	if num_of_spins > array_length(item3_array) and current_slot_hacking <= 3 {
		if item3_index < array_length(item3_array)-1 {
			item3_index += 1;
		}else {
			item3_index = 0;
		}
		item3 = item3_array[item3_index];
		if (win = true or twoinarow = true) and num_of_spins <= 15 and item1 = item2 and item2_locked = true {
			//spin_time *= 1.15;
		}
		
		if num_of_spins = array_length(item3_array)+1 and win = false and item3_locked = false {
			item3_locked = true;
			audio_play_sound(snd_slotmachine_stop,0,false);
		}
	}else if current_slot_hacking <= 3 {
		item3 = item3_array[item3_index];
		if (win = true or twoinarow = true) and item1 = item2 {
			//spin_time *= 1.15;
		}
		if win = true {
			if item3 != item2 {
				if item3_index < array_length(item3_array)-1 {
					item3_index += 1;
				}else {
					item3_index = 0;
				}
				item3 = item3_array[item3_index];
			}
			if item3 = item2 {
				num_of_spins = 0;
				if item3_locked = false {
					item3_locked = true;
					audio_play_sound(snd_slotmachine_stop,0,false);
				}
				spin = false;
			}
		}else {
			num_of_spins = 0;
			if item3_locked = false {
				item3_locked = true;
				audio_play_sound(snd_slotmachine_stop,0,false);
			}
			spin = false;
		}
	}
	//1
	if item1_index < array_length(item1_array)-1 and current_slot_hacking <= 1 {
		item1_next = item1_array[item1_index+1];
	}else if current_slot_hacking <= 1 {
		item1_next = item1_array[0];
	}
	//2
	if item2_index < array_length(item2_array)-1 and current_slot_hacking <= 2 {
		item2_next = item2_array[item2_index+1];
	}else if current_slot_hacking <= 2 {
		item2_next = item2_array[0];
	}
	//3
	if item3_index < array_length(item3_array)-1 and current_slot_hacking <= 3 {
		item3_next = item3_array[item3_index+1];
	}else if current_slot_hacking <= 3 {
		item3_next = item3_array[0];
	}

	alarm[2] = spin_time;
	//num_of_spins -= 1;
}else {
	if item1 = item2 and item2 = item3 {
		jackpot = true;
		global.win_odds = 30 + global.luck;
		jackpot_sound = audio_play_sound(snd_slotmachine_jackpot,0,false);
		audio_stop_sound(snd_slotmachine_spinning);
		if item3_locked = false {
			item3_locked = true;
			audio_play_sound(snd_slotmachine_stop,0,false);
		}
	}else if tryagain = false {
		tryagain = true;
		global.win_odds += 5;
		audio_play_sound(snd_slotmachine_lose,0,false);
		audio_stop_sound(snd_slotmachine_spinning);
	}
}
random_set_seed(global.seed);

item1 = item1_array[item1_index];
item2 = item2_array[item2_index];
item3 = item3_array[item3_index];