/*if alpha > 0 {
	alpha -= 0.02;	
}else {
	move_off_screen = true;	
}*/
if handle_frame < sprite_get_number(spr_slotmachine_handle) and handle_done = false { 
	handle_frame += 0.25;
	if handle_frame >= 5 and spin = false {
		spin = true;
		alarm[1] = spin_time;
		item1_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
		item2_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
		item3_index = irandom_range(0,sprite_get_number(spr_slotmachine_slot_items)-1);
	}
}else if handle_done = false  {
	handle_frame = 0;
	handle_done = true;
}

if jackpot = true {
	jackpot_index += 0.05;
}

if tryagain = true {
	tryagain_index += 0.05;
}

if tryagain_index > 6.9 or jackpot_index > 6.9 {
	fade_out = true;
	tryagain = false;
	//jackpot = false;
}

if fade_out = true {
	if image_alpha > 0 {
		image_alpha -= 0.05;
	}else {
		instance_destroy();	
	}
}