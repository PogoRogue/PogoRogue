/// @description Initialize variables
depth += 1;
colliding = false;
controller_sprite = spr_controller_button_top;
keyboard_sprite = spr_arrow_up;

test_mode = true;
if room = room_proc_gen_test and global.current_skin = 6 {
	test_mode = false;
}
if test_mode = true{
	if room = room_proc_gen_test {
		instance_destroy();	
	}	
}