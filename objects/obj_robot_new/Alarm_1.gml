/// @description Initiate jump

vspeed = jump_height;
if(!place_meeting(x, y - 2, obj_ground_parent)) {
	y -= 2;	
}

has_jumped = true;
jump_cooldown = room_speed * 3;
