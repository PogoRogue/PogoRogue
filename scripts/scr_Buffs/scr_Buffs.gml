// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Buffs(){
	buff_nothing = function() { }
	
	buff_heart = function() { 
		with obj_player {
			if hp < max_hp {
				hp += 8;	
				audio_play_sound(snd_heartPickup,0,false);
				with obj_player_health {
					heart_gain_num = other.hp;	
				}
			}
		}
	}
	
	buff_lasersight = function() { 
		laser_sight = true;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_planetarybullets = function() { 
		if planetary_bullets < 5 {
			planetary_bullets += 1;
			audio_play_sound(snd_passivePowerup,0,false);
		}
		if !instance_exists(obj_planetarybullets) {
			instance_create_depth(x,y,depth,obj_planetarybullets);
		}
	}
	
	buff_armor = function(){
		with obj_player {
			if armor_buff < max_armor_buff {
				armor_buff += 1;
				audio_play_sound(snd_ArmorHeart,0,false);
				with obj_player_health {
					heart_shield_gain_num = other.armor_buff;	
				}
			}
		}
	}
	
	buff_dmg = function(){
		global.damage_buff += 1;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_max_ammo = function(){
		with obj_player {
			if gun_1.bullets_per_bounce < gun_1.init_bullets_per_bounce + gun_1.max_added_bullets {
				gun_1.bullets_per_bounce += 1;
				gun_1.current_bullets += 1;
				audio_play_sound(snd_passivePowerup,0,false);
			}
			if gun_2.bullets_per_bounce < gun_2.init_bullets_per_bounce + gun_2.max_added_bullets and gun_2 != gun_1 {
				gun_2.bullets_per_bounce += 1;
				gun_2.current_bullets += 1;
				audio_play_sound(snd_passivePowerup,0,false);
			}
			if gun_3.bullets_per_bounce < gun_3.init_bullets_per_bounce + gun_3.max_added_bullets and gun_3 != gun_1 and gun_3 != gun_2 {
				gun_3.bullets_per_bounce += 1;
				gun_3.current_bullets += 1;
				audio_play_sound(snd_passivePowerup,0,false);
			}
		}
	}
	
	buff_max_hp = function(){
		with obj_player {
			if max_hp < max_max_hp {
				max_hp += 8;
				audio_play_sound(snd_passivePowerup,0,false);
			}
			if hp < max_hp {
				hp += 8;
				with obj_player_health {
					heart_gain_num = other.hp;	
				}
			}
		}
	}
	
	buff_luck = function(){
		global.luck += 10;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_pickybuyer = function(){
		global.picky_buyer = true;	
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_bouncybullets = function() {
		global.bouncy_bullets = 1;	
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_hotshells = function(){
		global.hot_shells = true;	
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_combomaster = function(){
		global.combo_master = true;	
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_blackfriday = function(){
		global.sale = 0.85;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_triplethreat = function(){
		with obj_player {
			num_of_weapons = 3;
			gun_array = [gun_1, gun_2, gun_3];
			audio_play_sound(snd_passivePowerup,0,false);
		}
	}
	
	buff_flamingcoins = function(){
		global.flaming_coins = true;	
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_combotime = function(){
		global.combo_time_added += 150;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_sharpshooter = function(){
		global.sharpshooter = true;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_coinsup = function(){
		global.added_coins += 1;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_sharptip = function(){
		obj_player.stomp_damage *= 2;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_experimentation = function(){
		global.experimentation = true;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_aerialassassin = function(){
		global.aerial_assassin = true;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_supershield = function(){
		global.super_shield = true;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_revive = function(){
		if global.revived = false {
			global.revive = true;
			audio_play_sound(snd_passivePowerup,0,false);
		}
	}
	
	buff_drilltipbullets = function(){
		global.drilltipbullets = true;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_dualwielder = function(){
		global.dualwielder = true;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_magicianstouch = function(){
		global.magicianstouch = true;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_tightspring = function(){
		global.tightspring = true;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_steadyhands = function(){
		global.steadyhands = true;
		audio_play_sound(snd_passivePowerup,0,false);
	}
	
	buff_impatience = function(){
		global.impatience = true;
	}
	
	buff_laststand = function(){
		global.laststand = true;
	}
	
	buff_psychicbullets = function(){
		global.psychicbullets = true;
	}
}