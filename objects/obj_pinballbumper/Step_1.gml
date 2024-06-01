if airbag = false {
	not_meeting = true;	
}

if spawned = true {
	with obj_player_mask {
		if place_meeting(x+parent_index.hspeed,y+parent_index.vspeed,other) and other.activated = false and other.not_meeting = true and parent_index.state != parent_index.state_bouncing {
			scr_Screen_Shake(4,8,false);
			audio_play_sound(other.activated_sound,0,false);
			other.activated = true;
			other.sprite_index = other.activated_sprite;
			other.image_speed = 1;
			if other.airbag = true {
				var prev_spd = parent_index.speed;
				parent_index.speed = 1 + abs(prev_spd);
			}else {
				parent_index.speed = 10;
			}
			parent_index.direction = point_direction(other.x,other.y,parent_index.x + lengthdir_x(22,parent_index.angle+90),parent_index.y + lengthdir_y(22,parent_index.angle+90));
			parent_index.state = parent_index.state_free;
		}
	}
}