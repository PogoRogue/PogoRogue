alpha = 3;
depth = -1000;

string_array = [];
draw = true;
do_effect = false;

move_off_screen = false;
y_subtract = 256;
move_spd = 4;
move_spd2 = 0;
spd_multiply = 1;

ready = true;
alarm[0] = 60;

if global.phase = 1 and room = room_proc_gen_test {
	entering_string = "I. The Factories"
}else if global.phase = 2 and room = room_proc_gen_test {
	entering_string = "II. The Offices"
}else if global.phase = 3 and room = room_proc_gen_test {
	entering_string = "III. Corporate"
}else if room = room_starting_area {
	entering_string = "Pogobot Hideout"
}else if  room = room_tutorial {
	entering_string = "Pogobot Training Facility"
}