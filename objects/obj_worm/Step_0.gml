/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

//change animation
//show_message(ev_animation_end)


//spr_enemy_walking_explosion = popout
//spr_enemy_turret_barrel = stay
//spr_enemy_walking_explosion_walk = recede
if(sprite_index == spr_enemy_walking_explosion)
//if animation end
	if (image_index > image_number - 1){
		sprite_index = spr_enemy_turret_barrel;
		if (alarm[1] < 0) {
		 alarm[1] = room_speed *5 ;
	}
}

if(sprite_index == spr_enemy_walking_explosion_walk){
	if (image_index > image_number - 1){
		depth = 201;
	}
	
}


//bullet control
if(depth == 201){
	bullet_speed = 0;
}

else{
	if(sprite_index == spr_enemy_turret_barrel){
		bullet_speed = 5;
	}
	
}


// Inherit the parent event
event_inherited();

