

if(state = "up" && sprite_index = spr_button_1){
	//show_message(point_direction(x,y,obj_player.x,obj_player.y));
	if(point_direction(x,y,obj_player.x,obj_player.y)>0 && point_direction(x,y,obj_player.x,obj_player.y)<180){
		
		sprite_index = spr_enemy_explode
		audio_play_sound(snd_collision,0,false);
		alarm[0] = room_speed * 5;
		//show_message("up")
	}

}
else if(state = "left" && sprite_index = spr_button_1 ){
	
	//show_message(point_direction(x,y,obj_player.x,obj_player.y));
	if(point_direction(x,y,obj_player.x,obj_player.y)>90 && point_direction(x,y,obj_player.x,obj_player.y)<270  ){
		//show_message("1")
		sprite_index = spr_enemy_explode
		audio_play_sound(snd_collision,0,false);
		alarm[0] = room_speed * 5;
		obj_player.hspeed *= -0.5;
		//show_message("l")
	}

}

else if(state = "down" && sprite_index = spr_button_1){
	
	if(point_direction(x,y,obj_player.x,obj_player.y)>180 && point_direction(x,y,obj_player_mask.x,obj_player_mask.y)<360){
		
		sprite_index = spr_enemy_explode
		audio_play_sound(snd_collision,0,false);
		alarm[0] = room_speed * 5;
		//show_message("r")
	}

}

else if(state = "right" && sprite_index = spr_button_1){
	
	if(point_direction(x,y,obj_player.x,obj_player.y)>270 && point_direction(x,y,obj_player.x,obj_player.y)<450){
		
		sprite_index = spr_enemy_explode
		audio_play_sound(snd_collision,0,false);
		alarm[0] = room_speed * 5;
		//show_message("r")
	}

}