if scr_Animation_Complete() and sprite_index = spr_laser_middle_animation and image_speed = 1 {
	//image_speed = 0;
	//image_index = sprite_get_number(sprite_index)-1;
	alarm[0] = 15;
	sprite_index = spr_laser;
	damage = 8;
}

if floor(image_index) <= 1 and sprite_index = spr_laser_middle_animation and image_speed = -1 {
	instance_destroy();
}

if !instance_exists(parent_index) {
	instance_destroy();
}else {
	if 	parent_index.is_dead = true {
		instance_destroy();
	}
}


	


var _collision = collision_line(start_x,start_y,start_x+lengthdir_x(1000,image_angle),start_y+lengthdir_y(1000,image_angle),obj_player_mask,true,true);
if(_collision != noone) {
	if(damage > 0) and obj_player.current_iframes <= 0 {
		scr_Player_Damaged(damage);
	}
}
