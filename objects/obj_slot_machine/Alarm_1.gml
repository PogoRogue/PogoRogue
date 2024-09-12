randomize();
var item1_index_prev = item1_index;
var item2_index_prev = item2_index;
var item3_index_prev = item3_index;
if num_of_spins > 0 {
	if num_of_spins > 16 {
		item1_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
		while item1_index = item1_index_prev {
			item1_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
		}
	}
	if num_of_spins > 10 {
		item2_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
		while item2_index = item2_index_prev {
			item2_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
		}
	}else {
		if win = true or twoinarow = true {
			if item2_index != item1_index {
				item2_index = item1_index;
			}
		}
		if item1_index = item2_index {
			spin_time *= 1.15;	//slow down if there are two matches to add suspense
		}
	}
	item3_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
	while item3_index = item3_index_prev {
		item3_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
	}
	alarm[1] = spin_time;
	num_of_spins -= 1;
}else {
	if win = true {
		if item3_index != item2_index {
			item3_index = item2_index;
		}
	}
	if item1_index = item2_index and item2_index = item3_index {
		jackpot = true;
		global.win_odds = 30 + global.luck;
	}else if tryagain = false {
		tryagain = true;
		global.win_odds += 5;
	}
}
random_set_seed(global.seed);