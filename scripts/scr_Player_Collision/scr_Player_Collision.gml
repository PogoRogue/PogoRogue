 // Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Player_Collision(){
	var prev_x = x;
	var prev_y = y;
	
	//check for collision with ground y axis
	if (place_meeting(x,y+vspeed,obj_launchpad)) and vspeed > 0 {
		var launchpad_obj = instance_place(x,y+vspeed,obj_launchpad);
		if !place_meeting(x,y-1,launchpad_obj) {
			while !(place_meeting(x,y+sign(vspeed),obj_launchpad)) {
				y += sign(vspeed);
			}
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
		aerial_assassin_count = 0;
		
		with (launchpad_obj) {
			if animating = false and not_meeting = true {
				animating = true;
				missiles_left -= 1;
				player_y = other.y;
				mask_index = spr_nothing;
				obj_player.launchpad = true;
				audio_play_sound(snd_launchpad,0,false);
			}
		}
	}
	
	//check for collision with one way ground
	if place_meeting(x,y+vspeed,obj_ground_oneway) and vspeed > 0 {
		var oneway_ground = instance_place(x,y+vspeed,obj_ground_oneway);
		if !place_meeting(x,y-1,oneway_ground) {
			while !(place_meeting(x,y+sign(vspeed),obj_ground_oneway)) {
				y += sign(vspeed);
			}
			state = state_bouncing;
			speed = 0; //stop player movement while bouncing
			aerial_assassin_count = 0;
		}
	}
	
	//check for collision with ground y axis
	/*if (place_meeting(x+hspeed,y,obj_launchpad)) and free = true {
		var launchpad = instance_place(x+hspeed,y,obj_launchpad);
		while !(place_meeting(x+sign(hspeed),y,obj_launchpad)) {
			x += sign(hspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
		aerial_assassin_count = 0;
	}*/
	
	//check for collision with ground x axis
	if (place_meeting(x+hspeed,y,obj_ground)) and free = true {
		while !(place_meeting(x+sign(hspeed),y,obj_ground)) {
			x += sign(hspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
		aerial_assassin_count = 0;
	}
	
	//check for collision with ground y axis
	if (place_meeting(x,y+vspeed,obj_ground)) and free = true and obj_player_mask.right_corner = false and  obj_player_mask.left_corner = false {
		while !(place_meeting(x,y+sign(vspeed),obj_ground)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
		aerial_assassin_count = 0;
	}
	
	//check for collision with on off platform	
	if (place_meeting(x,y+vspeed,obj_temp_platform_on_off) and !place_meeting(x,y-1,obj_temp_platform_on_off)) and vspeed > 0 and platform_on {
		while !(place_meeting(x,y+sign(vspeed),obj_temp_platform_on_off)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
		aerial_assassin_count = 0;
	}
	
	//check for collision with off on platform	
	if (place_meeting(x,y+vspeed,obj_temp_platform_off_on) and !place_meeting(x,y-1,obj_temp_platform_off_on)) and vspeed > 0 and !platform_on {
		while !(place_meeting(x,y+sign(vspeed),obj_temp_platform_off_on)) {
			y += sign(vspeed);
		}
		state = state_bouncing;
		speed = 0; //stop player movement while bouncing
		aerial_assassin_count = 0;
	}

	//unfreeze
	if state = state_bouncing {
		grv = init_grv;
		rotation_speed = original_rotation_speed;
		rotation_delay = rotation_speed / 10;
	}
	
	if abs(x - prev_x) > 16 {
		x  = prev_x;
		show_debug_message("BUG FIXED X PLAYER");
	}

	if abs(y - prev_y) > 16 {
		y  = prev_y;
		show_debug_message("BUG FIXED Y PLAYER");
	}
}