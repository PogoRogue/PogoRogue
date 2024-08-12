//skin offsets

//adjust y position of hurt sprites
if current_iframes > 0 and bubble = false || dead {
	if hp >= 8 * 4 { //4 or more hearts left
		current_hurt_array = hurt1_array;
		hurt_sprite = current_hurt_array[global.current_skin];	
	}else if hp >= 8 * 3 { //3 hearts left
		current_hurt_array = hurt2_array;
		hurt_sprite = current_hurt_array[global.current_skin];		
	}else if hp >= 8 * 2 { //2 hearts left
		current_hurt_array = hurt3_array;
		hurt_sprite = current_hurt_array[global.current_skin];		
	}else { //1 or fewer hearts left
		current_hurt_array = hurt4_array;
		hurt_sprite = current_hurt_array[global.current_skin];	
	}
}

if sprite_index = player_sprite {
	switch(floor(image_index)) {
		case 0: hurt_yoffset = 0; break;
		case 1: hurt_yoffset = 3; break;
		case 2: hurt_yoffset = 5; break;
		case 3: hurt_yoffset = 7; break;
		case 4: hurt_yoffset = 8; break;
		case 5: hurt_yoffset = 10; break;
		case 6: hurt_yoffset = 10; break;
		case 7: hurt_yoffset = 11; break;
		case 8: hurt_yoffset = 11; break;
		case 9: hurt_yoffset = 11; break;
		case 10: hurt_yoffset = 11; break;
		case 11: hurt_yoffset = 11; break;
		default: hurt_yoffset = 11; break;
	}
}else if sprite_index = falling_sprite {
	switch(floor(image_index)) {
		case 0: hurt_yoffset = 1; break;
		case 1: hurt_yoffset = 1; break;
		case 2: hurt_yoffset = 0; break;
		case 3: hurt_yoffset = 0; break;
	}
}else if sprite_index = charging_sprite {
	if floor(image_index) % 2 = 0 {
		hurt_yoffset = 11;
	}else {
		hurt_yoffset = 10;
	}
}

//hat/combo offset
if global.current_skin = 1 {
	hat_yoffset = 3;
	combo_offset = 4;
}else if global.current_skin = 2 {
	hat_yoffset = 2;
	combo_offset = 5;
}else if global.current_skin = 3 {
	hat_yoffset = 2;
	combo_offset = 5;
}else if global.current_skin = 4 {
	hat_yoffset = 2;
	combo_offset = 4;
}else if global.current_skin = 5 {
	hat_yoffset = 2;
	combo_offset = 5;
}else if global.current_skin = 6 {
	hat_yoffset = 0;
	combo_offset = 1;
}else {
	hat_yoffset = 0;
	combo_offset = 1;
}