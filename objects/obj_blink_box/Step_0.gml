key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_up = global.key_up_menu;
key_down = global.key_down_menu;

if obj_player.pickup_1 = obj_player.pickup_blink {  
	key_select = global.key_pickup_1_pressed;
}else if obj_player.pickup_2 = obj_player.pickup_blink {  
	key_select = global.key_pickup_2_pressed;
}else {
	key_select = 0;
}

if key_left or key_right or key_up or key_down {
	moved = true;	
}

if draw_respawn = false and obj_player.image_yscale = 0 {
	x += (-key_left + key_right) * move_speed;
	y += (-key_up + key_down) * move_speed;
}

//view restraints
sprite_half = sprite_get_width(sprite_index)/2;
x = min(x,camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])-sprite_half));
x = max(x,camera_get_view_x(view_camera[0])+sprite_half);
y = min(y,camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])-sprite_half));
y = max(y,camera_get_view_y(view_camera[0])+sprite_half);

//check if area is open
if place_meeting(x,y,obj_ground) or place_meeting(x,y,obj_ground_tiles) or place_meeting(x,y,obj_ground_tiles_outer) 
or place_meeting(x,y,obj_enemy_parent) or place_meeting(x,y,obj_pinballbumper) or place_meeting(x,y,obj_spike) {
	free = false;	
}else {
	free = true;	
}

//timer
if time_left > 0 {
	time_left -= 1;	
}else {
	time_end = true;
}

if free = true {
	image_index = 0;
	if key_select or time_end = true {
		draw_respawn = true;
		with obj_player {
			x = other.x+other.x_diff;
			y = other.y+other.y_diff;
		}
	}
}else {
	image_index = 1;
	if key_select {
		audio_play_sound(snd_unavailable,0,false);
	}
	if time_end = true and draw_respawn = false {
		draw_respawn = true;
		audio_play_sound(snd_unavailable,0,false);
	}
}

if draw_respawn = true {
	if new_xscale != init_xscale {
		new_xscale += 0.1 * sign(init_xscale);
	}
	if new_yscale != init_yscale {
		new_yscale += 0.1 * sign(init_yscale);
	}else {
		//finish code here	
		with obj_player {
			audio_play_sound(snd_blink_respawn,0,false);
			state = state_free;	
			can_rotate = true;
			can_shoot = true;
			pickup_blink.on_cooldown = true;
			pickup_blink.cooldown_time = pickup_blink.max_cooldown_time;
			mask_index = sprite_index;
			with obj_player_mask {
				mask_index = sprite_index;
			}
			image_xscale = other.init_xscale;
			image_yscale = other.init_yscale;
		}
		instance_destroy();
	}
}

//alpha
if (arrows_alpha > 0 and moved = true and obj_player.image_yscale = 0) {
	arrows_alpha -= 0.05;	
}