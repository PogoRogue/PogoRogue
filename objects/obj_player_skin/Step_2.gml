if sprite_index = player_sprite {
	switch(floor(image_index)) {
		case 0: skin_yoffset = 0; break;
		case 1: skin_yoffset = 3; break;
		case 2: skin_yoffset = 5; break;
		case 3: skin_yoffset = 7; break;
		case 4: skin_yoffset = 8; break;
		case 5: skin_yoffset = 10; break;
		case 6: skin_yoffset = 10; break;
		case 7: skin_yoffset = 11; break;
		case 8: skin_yoffset = 11; break;
		case 9: skin_yoffset = 11; break;
		case 10: skin_yoffset = 11; break;
		case 11: skin_yoffset = 11; break;
		default: skin_yoffset = 11; break;
	}
}else if sprite_index = falling_sprite {
	switch(floor(image_index)) {
		case 0: skin_yoffset = 1; break;
		case 1: skin_yoffset = 1; break;
		case 2: skin_yoffset = 0; break;
		case 3: skin_yoffset = 0; break;
	}
}

//hat offset
if skin_num = 1 {
	text_offset = 3;
}else if skin_num = 2 {
	text_offset = 5;
}else if skin_num = 3 {
	text_offset = 5;
}else if skin_num = 4 {
	text_offset = 2;
}else if skin_num = 5 {
	text_offset = 3;
}else if skin_num = 6 {
	text_offset = 1;
}else {
	text_offset = 1;
}