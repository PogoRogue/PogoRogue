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
			}else if global.iron_proficiency = true {
				if armor_buff < max_armor_buff {
					armor_buff += 1;
					audio_play_sound(snd_ArmorHeart,0,false);
					with obj_player_health {
						heart_shield_gain_num = other.armor_buff;	
					}
				}
			}
		}
	}
	
	buff_lasersight = function() { 
		laser_sight = true;
		
	}
	
	buff_planetarybullets = function() { 
		if planetary_bullets < 5 {
			planetary_bullets += 1;
			
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
		
	}
	
	buff_max_ammo = function(){
		with obj_player {
			if gun_1.bullets_per_bounce < gun_1.init_bullets_per_bounce + gun_1.max_added_bullets {
				gun_1.bullets_per_bounce += gun_1.burst_number;
				gun_1.current_bullets += gun_1.burst_number;
				
			}
			if gun_2.bullets_per_bounce < gun_2.init_bullets_per_bounce + gun_2.max_added_bullets and gun_2 != gun_1 {
				gun_2.bullets_per_bounce += gun_2.burst_number;
				gun_2.current_bullets += gun_2.burst_number;
				
			}
			if gun_3.bullets_per_bounce < gun_3.init_bullets_per_bounce + gun_3.max_added_bullets and gun_3 != gun_1 and gun_3 != gun_2 {
				gun_3.bullets_per_bounce += gun_3.burst_number;
				gun_3.current_bullets += gun_3.burst_number;
				
			}
		}
	}
	
	buff_max_hp = function(){
		with obj_player {
			if max_hp < max_max_hp {
				max_hp += 8;
				
			}else if global.iron_proficiency = true {
				if armor_buff < max_armor_buff {
					armor_buff += 1;
					audio_play_sound(snd_ArmorHeart,0,false);
					with obj_player_health {
						heart_shield_gain_num = other.armor_buff;	
					}
				}
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
		global.luck += 5;
		
	}
	
	buff_pickybuyer = function(){
		global.picky_buyer += 1;	
		
	}
	
	buff_bouncybullets = function() {
		global.bouncy_bullets = 1;	
		
	}
	
	buff_hotshells = function(){
		global.hot_shells = true;	
		
	}
	
	buff_combomaster = function(){
		global.combo_master = true;	
		
	}
	
	buff_blackfriday = function(){
		global.sale = 0.85;
		
	}
	
	buff_triplethreat = function(){
		with obj_player {
			global.triplethreat = true;
			num_of_weapons = 3;
			gun_array = [gun_1, gun_2, gun_3];
			
		}
	}
	
	buff_flamingcoins = function(){
		global.flaming_coins = true;	
		
	}
	
	buff_combotime = function(){
		global.combo_time_added += 150;
	}
	
	buff_sharpshooter = function(){
		global.sharpshooter = true;
		
	}
	
	buff_coinsup = function(){
		global.added_coins += 1;
		
	}
	
	buff_sharptip = function(){
		obj_player.stomp_damage += 12;
		
	}
	
	buff_experimentation = function(){
		global.experimentation += 1;
		
	}
	
	buff_aerialassassin = function(){
		global.aerial_assassin = true;
		
	}
	
	buff_supershield = function(){
		global.super_shield = true;
		
	}
	
	buff_revive = function(){
		if global.revived = false {
			global.revive = true;
			if room != room_tutorial {
				
			}
		}
	}
	
	buff_drilltipbullets = function(){
		global.drilltipbullets = true;
		
	}
	
	buff_dualwielder = function(){
		global.dualwielder = true;
		
	}
	
	buff_magicianstouch = function(){
		global.magicianstouch = true;
		
	}
	
	buff_tightspring = function(){
		global.tightspring = true;
		
	}
	
	buff_steadyhands = function(){
		global.steadyhands = true;
		
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
	
	buff_righteousrevenge = function(){
		global.righteousrevenge = true;
		
	}
	
	buff_robbery = function(){
		global.robbery = true;
		
	}
    
	buff_recycling = function(){
		global.recycling += 1;
		
	}
	
	buff_juggler = function(){
		global.juggler = true;    
		
	}
	
	buff_invincibilityup = function(){
		obj_player.iframes_add += 0.75;
		
	}
	
	buff_doublekill = function() { 
		if double_kill < 3 {
			double_kill += 1;
			
		}
	}
	
	buff_ironproficiency = function(){
		global.iron_proficiency = true;    
		
	}
	
	buff_fastforward = function(){
		if global.fast_forward < 3 {
			global.fast_forward += 1;
		}
		
	}
	
	buff_paparazzi = function(){
		global.paparazzi = true;
	}
	
	buff_crit = function(){
		global.critchance += 1;
		global.crit_percentage += 5;
	}
	
	buff_bartime = function(){
		global.bar_time_added += 0.25;
		global.bartime += 25;
	}
}