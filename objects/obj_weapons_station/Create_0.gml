/// @description Initialize variables
depth += 1;
colliding = false;
controller_sprite = spr_controller_button_top;
keyboard_sprite = spr_arrow_up;

if (room = room_proc_gen_test and global.current_skin < 2 
or room = room_proc_gen_test and global.current_skin = 3) or object_get_name(object_index) = "obj_seeding_station" {
	test_mode = false; //set false for builds
}else {
	test_mode = true; //set false for builds
	if room = room_proc_gen_test {
		//instance_destroy();	
	}
}

/*
if global.current_skin = 6 and room = room_proc_gen_test {
	instance_destroy();	
	instance_create_depth(x,y,depth,obj_pickup_station)
}
