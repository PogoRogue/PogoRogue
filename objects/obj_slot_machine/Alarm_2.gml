//spin
randomize();
if num_of_spins > 0 {
	//item 1
	if num_of_spins > 21 {
		if item1_index < array_length(item1_array)-1 {
			item1_index += 1;
		}else {
			item1_index = 0;
		}
		item1 = item1_array[item1_index];
		
		if num_of_spins = 22 {
			item1_locked = true;	
		}
	}
	//item 2
	if num_of_spins > 15 {
		if item2_index < array_length(item2_array)-1 {
			item2_index += 1;
		}else {
			item2_index = 0;
		}
		item2 = item2_array[item2_index];
		
		if num_of_spins = 16 and !(win = true or twoinarow = true) {
			item2_locked = true;	
		}
	}else {
		if win = true or twoinarow = true {
			if item2 != item1 {
				if item2_index < array_length(item2_array)-1 {
					item2_index += 1;
				}else {
					item2_index = 0;
				}
				item2 = item2_array[item2_index];
				if item2 = item1 {
					item2_locked = true;	
				}
			}else {
				item2_locked = true;	
			}
		}else {
			item2_locked = true;
		}
	}
	//item 3
	if num_of_spins > array_length(item3_array) {
		if item3_index < array_length(item3_array)-1 {
			item3_index += 1;
		}else {
			item3_index = 0;
		}
		item3 = item3_array[item3_index];
		if (win = true or twoinarow = true) and num_of_spins <= 15 and item1 = item2 and item2_locked = true {
			spin_time *= 1.15;
		}
		
		if num_of_spins = array_length(item3_array)+1 and win = false {
			item3_locked = true;	
		}
	}else {
		if win = true {
			if (win = true or twoinarow = true) and item1 = item2 {
				spin_time *= 1.15;
			}
			if item3 != item2 {
				if item3_index < array_length(item3_array)-1 {
					item3_index += 1;
				}else {
					item3_index = 0;
				}
				item3 = item3_array[item3_index];
				
				if item3 = item2 {
					num_of_spins = 0;
					item3_locked = true;
				}
			}else {
				num_of_spins = 0;
				item3_locked = true;
			}
		}else {
			num_of_spins = 0;
			item3_locked = true;
		}
	}
	alarm[2] = spin_time;
	num_of_spins -= 1;
}else {
	if item1 = item2 and item2 = item3 {
		jackpot = true;
		global.win_odds = 33;
	}else if tryagain = false {
		tryagain = true;
		global.win_odds += 5;
	}
}
random_set_seed(global.seed);

//1
if item1_index < array_length(item1_array)-1 {
	item1_next = item1_array[item1_index+1];
}else {
	item1_next = item1_array[0];
}
//2
if item2_index < array_length(item2_array)-1 {
	item2_next = item2_array[item2_index+1];
}else {
	item2_next = item2_array[0];
}
//3
if item3_index < array_length(item3_array)-1 {
	item3_next = item3_array[item3_index+1];
}else {
	item3_next = item3_array[0];
}

item1_y = 0;
item2_y = 0;
item3_y = 0;