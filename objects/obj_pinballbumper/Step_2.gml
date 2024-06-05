//mask index
if activated = true {
	mask_index = spr_nothing;	
}else {
	if spawned = true {
		sprite_index = starting_sprite;
		image_speed = 0;
		image_index = 0;
		mask_index = sprite_index;	
	}
}

//collision
if spawned = true {
	with obj_player {
		if place_meeting(x+hspeed,y+vspeed,other) and other.activated = false and other.not_meeting = true and state != state_bouncing {
			scr_Screen_Shake(4,8,false);
			audio_play_sound(other.activated_sound,0,false);
			other.activated = true;
			other.sprite_index = other.activated_sprite;
			other.image_speed = 1;
			speed = 10;
			if other.airbag = true {
				if y < other.bbox_top+vspeed {
					direction = angle+90;
					var prev_spd = speed;
					var prev_dir = direction;
					scr_Jump(0); //reload
					speed = prev_spd + 0.5;
					direction = prev_dir;
				}else {
					direction = point_direction(other.x,other.y,x + lengthdir_x(22,angle+90),y + lengthdir_y(22,angle+90));
					var prev_spd = speed;
					var prev_dir = direction;
					scr_Jump(0); //reload
					speed = prev_spd + 0.5;
					direction = prev_dir;
				}
				other.bounced_on = true;
			}else {
				direction = point_direction(other.x,other.y,x + lengthdir_x(22,angle+90),y + lengthdir_y(22,angle+90));
				var prev_spd = speed;
				var prev_dir = direction;
				scr_Jump(0); //reload
				speed = prev_spd;
				direction = prev_dir;
			}
			state = state_free;
		}
	}

	if sprite_index = activated_sprite and scr_Animation_Complete() {
		activated = false;
	}
}