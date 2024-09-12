/// @description Initialize variables
depth += 1;
colliding = false;
controller_sprite = spr_controller_button_top;
keyboard_sprite = spr_arrow_up;

/*
if global.current_skin = 6 and room = room_proc_gen_test {
	instance_destroy();	
	instance_create_depth(x,y,depth,obj_pickup_station)
}