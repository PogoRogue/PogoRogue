if instance_exists(parent_index) {
	
	
	if (collision_line(x,y,x+lengthdir_x(512,new_direction),y+lengthdir_y(512,new_direction),obj_player_mask,false,true)
	or collision_line(x,y,x+lengthdir_x(512,new_direction),y+lengthdir_y(512,new_direction),obj_player,false,true))
	and launched = false and direction_set = true and retract = false {
		launched = true;
		parent_index.launched_num += 1;
		scr_Screen_Shake(4,10,false);
	}
	
	if launched = false {
		x = parent_index.x;
		y = parent_index.y;
	}else {
		speed = 4;
		direction = new_direction;
	}
	
	depth = parent_index.depth + 2;
}else if launched = false {
	instance_destroy();
}

if retract = true and retracted = false and launched = false {
	if image_index = 0 {
		sprite_index = spr_boss_volleyball_spikes_retract1;
		image_index = 0;
		image_speed = 1;
	}else if image_index = 1 {
		sprite_index = spr_boss_volleyball_spikes_retract2;
		image_index = 0;
		image_speed = 1;
	}else if image_index = 2 {
		sprite_index = spr_boss_volleyball_spikes_retract3;
		image_index = 0;
		image_speed = 1;
	}else if image_index = 3 {
		sprite_index = spr_boss_volleyball_spikes_retract4;
		image_index = 0;
		image_speed = 1;
	}else if image_index = 4 {
		sprite_index = spr_boss_volleyball_spikes_retract5;
		image_index = 0;
		image_speed = 1;
	}else if image_index = 5 {
		sprite_index = spr_boss_volleyball_spikes_retract6;
		image_index = 0;
		image_speed = 1;
	}
	retracted = true;
}else if retract = true {
	if floor(image_index) >= 10 {
		instance_destroy();
	}
}