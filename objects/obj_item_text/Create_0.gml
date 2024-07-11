alpha = 3;
depth = -1000;

if room = room_items or room = room_tutorial {
	instance_destroy();	
}

//alarm[0] = 1;

string_array = [];
draw = false;
do_effect = false;

current_effect_char = -7;
move_off_screen = false;
y_subtract = 80;
move_spd = 4;
move_spd2 = 0;
spd_multiply = 1;

ready = false;
text_number = instance_number(obj_item_text);