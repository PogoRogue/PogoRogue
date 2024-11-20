/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state();

switch poke_direction {
	case "up": image_xscale = 1; image_yscale = 1; image_angle = 0; break;
	case "down": image_xscale = 1; image_yscale = -1; image_angle = 0; break;	
	case "left": image_xscale = 1; image_yscale = -1; image_angle = 90; break;	
	case "right": image_xscale = 1; image_yscale = 1; image_angle = 90; break;	
}

with obj_boss_mole_controller {
	if current_moles_left = 2 {
		other.pause_time_poke= 90;
	}
	if current_moles_left = 1 {
		other.pause_time_poke = 60;
	}
}

if megabounce_freeze = true and obj_player.state = obj_player.state_free {
	megabounce_freeze = false;
}

if megabounce_freeze = true {
	freeze = true;
	red_frames = 1;
	alarm[5] = 2;	
	
	if poke_direction != "down" and state = state_poke {
		reached_end = true;
		bounced_on = true;
	}
}

if freeze = true {
	x = freeze_x;
	y = freeze_y;
	image_index = freeze_frame;
	speed = 0;	
}

if hp <= 0 and died = false and is_dead {
	died = true;
	death_x = x;
	death_y = y;
	
	//create coins
	if instance_number(obj_boss_mole_parent) <= 1 {
		if global.phase = 1 {
			with instance_create_depth(x,y,-20,obj_coin_spawner) {
				num_of_coins = 50;
			}
		}else {
			with instance_create_depth(x,y,-20,obj_coin_spawner) {
				num_of_coins = 100;
			}
		}
	}
}

if died = true {
	x = death_x;
	y = death_y;
}

if red_frames > 0 and freeze = false  {
	if other.is_bomb = true {
		image_index = 11;
		image_alpha = 0;
		pause_time = 0;
		if audio_is_playing(snd_mole_bomb_fuse) {
			audio_stop_sound(snd_mole_bomb_fuse);
		}
	}
	
	freeze = true;
	freeze_x = x;
	freeze_y = y;
	freeze_frame = image_index;
	alarm[5] = 3;	
}

if is_bomb = true {
	sprite_index = spr_mole_bomb;
	hp = current_bomb_hp;
}else {
	//sprite_index = init_sprite;
}

depth = 501;

