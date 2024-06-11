

//fade out
if fade_out = true {
	image_alpha -= 0.025;
	if image_alpha <= 0 {
		instance_destroy();	
		obj_player.shield_bubble = false;
	}
}

if destroy_time_live > 0 {
	destroy_time_live -= 1;
}

if decrease_arrows_alpha {
	arrows_alpha -= 0.05;
}

if obj_player.state = obj_player.state_shieldbubble {

//COLLISIONS

if not_colliding = true {
	
	//pop
	if place_meeting(x,y,obj_spike) {
		alarm[1] = 1;
	}
	
	//check for collision with ground x axis
	if (place_meeting(x+obj_player.hspeed,y,obj_ground)) and !place_meeting(x,y,obj_ground) and obj_player.hspeed < 0 {
		while !(place_meeting(x+sign(obj_player.hspeed),y,obj_ground)) {
			x += sign(obj_player.hspeed);
		}
		prev_hspd = obj_player.hspeed;
		obj_player.hspeed = 0;
		bouncing = true;
		bouncing_left = true;
		sprite_index = spr_shieldbubble_new_left;
		bounced = false;
		bounced_cancel = true;
		//obj_player.hspeed *= -1; //stop player movement while bouncing
	}else if (place_meeting(x+obj_player.hspeed,y,obj_ground)) and !place_meeting(x,y,obj_ground) and obj_player.hspeed > 0 { //check for collision with ground x axis
		while !(place_meeting(x+sign(obj_player.hspeed),y,obj_ground)) {
			x += sign(obj_player.hspeed);
		}
		prev_hspd = obj_player.hspeed;
		obj_player.hspeed = 0;
		bouncing = true;
		bouncing_right = true;
		sprite_index = spr_shieldbubble_new_right;
		bounced = false;
		bounced_cancel = true;
		//obj_player.hspeed *= -1; //stop player movement while bouncing
	}
}

//BOUNCING
if bouncing = true {
	image_index += 0.75;
	if bounced_cancel = false {
		bounced = true;
	}
	//player x/y offset during bounce
	if bouncing_bottom = true {
		switch (floor(image_index)) {
			case 0: bounce_y= y; break;
			case 1: bounce_y = y + 6; break;
			case 2: bounce_y = y + 10; break;
			case 3: bounce_y = y + 14; break;
			case 4: bounce_y = y + 14; break;
			case 5: bounce_y = y + 15; break;
			case 6: bounce_y = y + 15; break;
			case 7: bounce_y = y + 15; break;
			case 8: bounce_y = y + 15; break;
			case 9: bounce_y = y + 15; break;
			case 10: bounce_y = y + 10; break;
			case 11: bounce_y = y + 6; break;
			case 12: bounce_y = y; break;
			case 13: bounce_y = y; break;
			default: bounce_y = y; break;
		}
	}else if bouncing_top = true {
		
		switch (floor(image_index)) {
			case 0: bounce_y= y; break;
			case 1: bounce_y = y - 5; break;
			case 2: bounce_y = y - 10; break;
			case 3: bounce_y = y - 13; break;
			case 4: bounce_y = y - 13; break;
			case 5: bounce_y = y - 13; break;
			case 6: bounce_y = y - 10; break;
			case 7: bounce_y = y - 5; break;
			case 8: bounce_y = y; break;
			case 9: bounce_y = y; break;
			default: bounce_y = y; break;
		}
	}else if bouncing_right = true {
		switch (floor(image_index)) {
			case 0: bounce_x = x; break;
			case 1: bounce_x = x + 6; break;
			case 2: bounce_x = x + 11; break;
			case 3: bounce_x = x + 15; break;
			case 4: bounce_x = x + 15; break;
			case 5: bounce_x = x + 15; break;
			case 6: bounce_x = x + 11; break;
			case 7: bounce_x = x + 6; break;
			case 8: bounce_x = x; break;
			case 9: bounce_x = x; break;
			default: bounce_x = x; break;
		}
	}else if bouncing_left = true {
		switch (floor(image_index)) {
			case 0: bounce_x = x; break;
			case 1: bounce_x = x - 6; break;
			case 2: bounce_x = x - 11; break;
			case 3: bounce_x = x - 15; break;
			case 4: bounce_x = x - 15; break;
			case 5: bounce_x = x - 15; break;
			case 6: bounce_x = x - 11; break;
			case 7: bounce_x = x - 6; break;
			case 8: bounce_x = x; break;
			case 9: bounce_x = x; break;
			default: bounce_x = x; break;
		}
	}
	
	//bounce
	if scr_Animation_Complete() {
		bouncing = false;
		image_index = 0;
		image_speed = 0;
		if bouncing_bottom = true {
			with obj_player {
				direction = angle+90;
				scr_Jump(0);
				image_speed = 0;
				image_index = 10;
				state = state_shieldbubble;
				if other.bounced_cancel = true {
					other.bounced_cancel = false;
				}
			}
			with obj_shieldbubble_mask {
				//check for collision with spring
				if place_meeting(x,y+1,obj_spring) {
					if instance_place(x,y+1,obj_spring).state = instance_place(x,y+1,obj_spring).state_unsprung {
			
						with instance_place(x,y+1,obj_spring) {
							state = state_springing;
							audio_play_sound(snd_springboard,0,false);
						}
						
						obj_player.vspeed = 0;
						with obj_player {
							if(global.tightspring) and vspeed = 0 {
								motion_add(90,(12)*1.2);
							}else if vspeed = 0 {
								motion_add(90,(12));
							}
						}
					}
				}
			}
			obj_player.platform_on = !obj_player.platform_on;
		}else if bouncing_top = true {
			with obj_player {
				//direction = angle+90;
				//scr_Jump(0);
				vspeed = other.prev_vspd * -1;
				if vspeed < 5 {
					vspeed = 5;
				}
				image_speed = 0;
				image_index = 10;
				state = state_shieldbubble;
				if other.bounced_cancel = true {
					other.bounced_cancel = false;
				}
			}
		}else if bouncing_left = true or bouncing_right = true {
			with obj_player {
				direction = angle+90;
				//scr_Jump(0);
				speed = 0;
				hspeed = other.prev_hspd * -1;
				if abs(hspeed) < 7 {
					hspeed = sign(hspeed) * 7;
				}
				image_speed = 0;
				image_index = 10;
				state = state_shieldbubble;
				if other.bounced_cancel = true {
					other.bounced_cancel = false;
				}
			}
		}
		
		bouncing_bottom = false;
		bouncing_left = false;
		bouncing_top = false;
		bouncing_right = false;
		prev_hspd = 0;
		prev_vspd = 0;
	}
}else {
	bounce_x = x;	
	bounce_y = y;	
}

}