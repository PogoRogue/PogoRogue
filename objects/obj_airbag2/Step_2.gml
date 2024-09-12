/// @description Insert description here
// You can write your code in this editor

activated_sound = snd_carhorn;

// Inherit the parent event
event_inherited();

if bounced_on = true and heart_increased = false {
	heart_increased = true;
	global.airbag_number += 1;
	if global.airbag_number >= 10 {
		with obj_player {
			var hearts_used = 1;
			while hp < max_hp and hearts_used > 0 {
				hp += 8;	
				audio_play_sound(snd_heartPickup,0,false);
				instance_activate_object(obj_player_health);
				instance_create_depth(28 + ((hp-8) * 3), 32,depth-1,obj_heart_gain);
				hearts_used -= 1;
			}
			while armor_buff < max_armor_buff and hearts_used > 0 {
				armor_buff += 1;
				audio_play_sound(snd_ArmorHeart,0,false);
				instance_create_depth(28 + (max_hp/8 * 24) + ((armor_buff-1) * 24), 32,depth-1,obj_heart_shield_gain);
				hearts_used -= 1;
			}
		}
		global.airbag_number = 0;
	}
}