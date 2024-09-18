/// @description Insert description here
// You can write your code in this editor

if room = room_starting_area or room = room_proc_gen_test {
	is_active = true;	
}

if(!is_active) {
	image_index = 2;
} else if(is_pressed) {
	image_index = 1;
} else {
	image_index = 0;
}
