// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Upgrade_Weapon(gunname_string,level){
	if level = 2 {
		#region Level 2
		if gunname_string = "Pistol" {
			var temp_weapon = obj_player.default_gun;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "Paintball Gun" {
			var temp_weapon = obj_player.paintball_gun;
			temp_weapon.ammo[0].sprite = spr_projectile_paintball2;
			temp_weapon.ammo[0].damage += 2;
		}else if gunname_string = "Shotgun" {
			var temp_weapon = obj_player.shotgun_gun;
			temp_weapon.spread_number = 9;
		}else if gunname_string = "Burst Rifle" {
			var temp_weapon = obj_player.burstfire_gun;
			temp_weapon.bullets_per_bounce += round(temp_weapon.bullets_per_bounce / temp_weapon.burst_number);
			temp_weapon.current_bullets += round(temp_weapon.bullets_per_bounce / temp_weapon.burst_number);
			temp_weapon.burst_number = 4;
			temp_weapon.current_burst = 0;
			temp_weapon.sound = snd_burstfire2;
			temp_weapon.burst_delay = 5;
		}else if gunname_string = "Javelins" {
			var temp_weapon = obj_player.javelin_gun;
			temp_weapon.spread_number = 3;
		}else if gunname_string = "Puncher" {
			var temp_weapon = obj_player.puncher_gun;
			temp_weapon.ammo[0].spd += 8;
		}else if gunname_string = "Six Shooter"  or gunname_string = "Seven Shooter" 
		or gunname_string = "Eight Shooter"  or gunname_string = "Nine Shooter"
		or gunname_string = "Ten Shooter" or gunname_string = "Eleven Shooter" {
			var temp_weapon = obj_player.sixshooter_gun;
			temp_weapon.reset_momentum = true;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
			with obj_player {
				switch(sixshooter_gun.bullets_per_bounce) {
					case 7: sixshooter_gun._name = "Seven Shooter"; break;
					case 8: sixshooter_gun._name = "Eight Shooter"; break;
					case 9: sixshooter_gun._name = "Nine Shooter"; break; 
					case 10: sixshooter_gun._name = "Ten Shooter"; break;
					case 11: sixshooter_gun._name = "Eleven Shooter"; break;
					default: sixshooter_gun._name = "Six Shooter"; break;
				}
			}
		}else if gunname_string = "Bouncy Ball Blaster" {
			var temp_weapon = obj_player.bouncyball_gun;
			temp_weapon.ammo[0].num_of_bounces += 1;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "Boomerangs" {
			var temp_weapon = obj_player.boomerang_gun;
			temp_weapon.ammo[0].spd += 2;
		}else if gunname_string = "Water Gun" {
			var temp_weapon = obj_player.water_gun;
			temp_weapon.bullets_per_bounce = 45;
			temp_weapon.current_bullets = round(temp_weapon.current_bullets);
		}else if gunname_string = "Machine Gun" {
			var temp_weapon = obj_player.machine_gun;
			temp_weapon.ammo[0].firerate_start = 8;
			temp_weapon.inaccuracy = 10;
		}else if gunname_string = "Grenade Launcher" {
			var temp_weapon = obj_player.grenade_gun;
			temp_weapon.momentum_added += 0.1;
			temp_weapon.ammo[0].spd += 1;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "Star Sucker" {
			var temp_weapon = obj_player.starsucker_gun;
			temp_weapon.spread_number = 14;
		}else if gunname_string = "Yo-yo" {
			var temp_weapon = obj_player.yoyo_gun;
			temp_weapon.ammo[0].sprite = spr_projectile_yoyo2;
			temp_weapon.ammo[0].damage += 4;
		}else if gunname_string = "Bubble Gun" {
			var temp_weapon = obj_player.bubble_gun;
			temp_weapon.bullets_per_bounce += 12;
			temp_weapon.current_bullets += 12;
		}else if gunname_string = "Slime Blaster" {
			var temp_weapon = obj_player.slime_gun;
			temp_weapon.spread_number += 30;
		}else if gunname_string = "Sniper Rifle" {
			var temp_weapon = obj_player.sniper_gun;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "Plasma Gun" {
			var temp_weapon = obj_player.plasma_gun;
		}else if gunname_string = "Laser Gun" {
			var temp_weapon = obj_player.laser_gun;
			temp_weapon.bullets_per_bounce += 75;
			temp_weapon.current_bullets += 75;
		}else if gunname_string = "Missile Launcher" {
			var temp_weapon = obj_player.missile_gun;
			temp_weapon.ammo[0].damage += 8;
		}
		#endregion
	}else if level = 3 {
		#region //Level 3
		if gunname_string = "Pistol" {
			var temp_weapon = obj_player.default_gun;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
			temp_weapon.ammo[0].spd += 6;
		}else if gunname_string = "Paintball Gun" {
			var temp_weapon = obj_player.paintball_gun;
			temp_weapon.firerate_start = 4;             
			temp_weapon.firerate_end = 4;
			temp_weapon.firerate = 4;
			temp_weapon.bullets_per_bounce += 2;
			temp_weapon.current_bullets += 2;
			temp_weapon.ammo[0].spd += 2;
			temp_weapon.ammo[0].damage += 2;
		}else if gunname_string = "Shotgun" {
			var temp_weapon = obj_player.shotgun_gun;
			temp_weapon.ammo[0].destroy_time = 15;
			temp_weapon.spread_number = 11;
		}else if gunname_string = "Burst Rifle" {
			var temp_weapon = obj_player.burstfire_gun;
			temp_weapon.bullets_per_bounce += 3;
			temp_weapon.current_bullets += 3;
			temp_weapon.burst_number = 5;
			temp_weapon.current_burst = 0;
			temp_weapon.sound = snd_burstfire3;
			temp_weapon.bullets_per_bounce += 5;
			temp_weapon.current_bullets +=  5;
			temp_weapon.burst_delay = 4;
		}else if gunname_string = "Javelins" {
			var temp_weapon = obj_player.javelin_gun;
		}else if gunname_string = "Puncher" {
			var temp_weapon = obj_player.puncher_gun;
			temp_weapon.ammo[0].spd += 8;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "Six Shooter"  or gunname_string = "Seven Shooter" 
		or gunname_string = "Eight Shooter"  or gunname_string = "Nine Shooter"
		or gunname_string = "Ten Shooter" or gunname_string = "Eleven Shooter" {
			var temp_weapon = obj_player.sixshooter_gun;
			temp_weapon.reset_momentum = true;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
			temp_weapon.momentum_added += 0.2;
			with obj_player {
				switch(sixshooter_gun.bullets_per_bounce) {
					case 7: sixshooter_gun._name = "Seven Shooter"; break;
					case 8: sixshooter_gun._name = "Eight Shooter"; break;
					case 9: sixshooter_gun._name = "Nine Shooter"; break; 
					case 10: sixshooter_gun._name = "Ten Shooter"; break;
					case 11: sixshooter_gun._name = "Eleven Shooter"; break;
					default: sixshooter_gun._name = "Six Shooter"; break;
				}
			}
		}else if gunname_string = "Bouncy Ball Blaster" {
			var temp_weapon = obj_player.bouncyball_gun;
			temp_weapon.ammo[0].num_of_bounces += 1;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "Boomerangs" {
			var temp_weapon = obj_player.boomerang_gun;
			temp_weapon.ammo[0].spd += 4;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "Water Gun" {
			var temp_weapon = obj_player.water_gun;
			temp_weapon.current_bullets = round(temp_weapon.current_bullets);
		}else if gunname_string = "Machine Gun" {
			var temp_weapon = obj_player.machine_gun;
			temp_weapon.ammo[0].firerate_start = 6;
			temp_weapon.inaccuracy = 5;
		}else if gunname_string = "Grenade Launcher" {
			var temp_weapon = obj_player.grenade_gun;
			temp_weapon.spread_number = 2;
		}else if gunname_string = "Star Sucker" {
			var temp_weapon = obj_player.starsucker_gun;
			temp_weapon.spread_number = 26;
		}else if gunname_string = "Yo-yo" {
			var temp_weapon = obj_player.yoyo_gun;
		}else if gunname_string = "Bubble Gun" {
			var temp_weapon = obj_player.bubble_gun;
			temp_weapon.bullets_per_bounce += 12;
			temp_weapon.current_bullets += 12;
			temp_weapon.firerate_start = 1;
			temp_weapon.firerate_end = 1;
			temp_weapon.firerate = 1;        
		}
		#endregion
	}else if level = 4 {
		#region //Level 4
		if gunname_string = "Pistol" {
			var temp_weapon = obj_player.default_gun;
			temp_weapon.spread_number = 3;
			temp_weapon.ammo[0].spd += 2;
			temp_weapon.spread_angle = 25;
		}else if gunname_string = "Paintball Gun" {
			var temp_weapon = obj_player.paintball_gun;
			temp_weapon.firerate_start = 3;             
			temp_weapon.firerate_end = 3;
			temp_weapon.firerate = 3;  
			temp_weapon.bullets_per_bounce += 3;
			temp_weapon.current_bullets += 3;
			temp_weapon.ammo[0].spd += 2;
			temp_weapon.ammo[0].damage += 2;
		}else if gunname_string = "Shotgun" {
			var temp_weapon = obj_player.shotgun_gun;
			temp_weapon.spread_number = 16;
			temp_weapon.spread_angle = 10;
		}else if gunname_string = "Burst Rifle" {
			var temp_weapon = obj_player.burstfire_gun;
			temp_weapon.spread_number = 3;
			temp_weapon.spread_angle = 15;
		}else if gunname_string = "Javelins" {
			var temp_weapon = obj_player.javelin_gun;
			temp_weapon.spread_number = 5;
			temp_weapon.spread_angle = 30;
		}else if gunname_string = "Puncher" {
			var temp_weapon = obj_player.puncher_gun;
			temp_weapon.ammo[0].spd += 4;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "Six Shooter"  or gunname_string = "Seven Shooter" 
		or gunname_string = "Eight Shooter"  or gunname_string = "Nine Shooter"
		or gunname_string = "Ten Shooter" or gunname_string = "Eleven Shooter" {
			var temp_weapon = obj_player.sixshooter_gun;
			temp_weapon.reset_momentum = true;
			temp_weapon.bullets_per_bounce = 11;
			temp_weapon.current_bullets = 11;
			temp_weapon.momentum_added += 0.4;
			temp_weapon._name = "Eleven Shooter";
			temp_weapon.inaccuracy = 0;
		}else if gunname_string = "Bouncy Ball Blaster" {
			var temp_weapon = obj_player.bouncyball_gun;
			temp_weapon.ammo[0].num_of_bounces += 1;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "Boomerangs" {
			var temp_weapon = obj_player.boomerang_gun;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
			temp_weapon.ammo[0].spd += 4;
		}else if gunname_string = "Water Gun" {
			var temp_weapon = obj_player.water_gun;
			temp_weapon.bullets_per_bounce = 60;
			temp_weapon.current_bullets = round(temp_weapon.current_bullets);
		}
		#endregion
	}
}