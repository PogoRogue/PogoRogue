/// @description collisions and open states

//player collision
if locked = false {
	with (obj_player) {
		if (place_meeting(x,y+vspeed,other) and !place_meeting(x,y-1,other) and vspeed > 0) 
		or (place_meeting(x,y+1,other) and !place_meeting(x,y-1,other) and vspeed = 0) {
			if other.open = false {
				other.image_index = 1;
				other.colliding = true;	
			}
		}else if (other.colliding and other.open = false and state != state_bouncing and state != state_chargejump and state != state_shieldbubble) {
			other.open = true;
			other.alarm[0] = 2;
			other.alarm[1] = 5;
			audio_play_sound(snd_chest_open,0,false);
		}
	}

	with obj_shieldbubble_mask {
		if (place_meeting(x,y+1,other) and !place_meeting(x,y-1,other) and obj_player.vspeed = 0) {
			if other.open = false {
				other.image_index = 1;
				other.colliding = true;	
			}
		}else if (other.colliding and other.open = false and parent_obj.bouncing = false and obj_player.state = obj_player.state_shieldbubble) {
			other.open = true;
			other.alarm[0] = 2;
			other.alarm[1] = 5;
			audio_play_sound(snd_chest_open,0,false);
		}
	}
}
	

with (obj_shieldbubble) {
	if scr_Animation_Complete() and bouncing = true {
		
	}
}

//projectile collision
with (obj_projectile) {
	if (place_meeting(x,y,other) and other.allow_projectile_collision) {
		other.open = true;
		other.image_index = 2;
		other.alarm[0] = 1;
		instance_destroy();
		audio_play_sound(snd_chest_open,0,false);
	}
}

//open
if (open) {
	if scr_Animation_Complete() = false {
		image_speed = 1;
	}else {
		image_speed = 0;
		mask_index = spr_treasurechest_new_mask2;
	}
	create_coins = true;
}

//increase coins
if (global.magicianstouch and coins_increased = false) {
	num_of_coins = round(num_of_coins * 1.5);
	coins_increased = true;
}