// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Upgrade_Weapon(gunname_string,level){
	if level = 2 {
		#region Level 2
		if gunname_string = "手枪" {
			var temp_weapon = obj_player.default_gun;
			//temp_weapon.bullets_per_bounce += 1;
			//temp_weapon.current_bullets += 1;
			temp_weapon.ammo[0].num_of_bounces += 1;
		}else if gunname_string = "彩弹枪" {
			var temp_weapon = obj_player.paintball_gun;
			temp_weapon.ammo[0].sprite = spr_projectile_paintball2;
			temp_weapon.ammo[0].damage += 2;
		}else if gunname_string = "霰弹枪" {
			var temp_weapon = obj_player.shotgun_gun;
			temp_weapon.spread_number = 9;
		}else if gunname_string = "脉冲步枪" {
			var temp_weapon = obj_player.burstfire_gun;
			temp_weapon.bullets_per_bounce += round(temp_weapon.bullets_per_bounce / temp_weapon.burst_number);
			temp_weapon.current_bullets += round(temp_weapon.bullets_per_bounce / temp_weapon.burst_number);
			temp_weapon.burst_number = 4;
			temp_weapon.current_burst = 0;
			temp_weapon.sound = snd_burstfire2;
			temp_weapon.burst_delay = 5;
		}else if gunname_string = "标枪" {
			var temp_weapon = obj_player.javelin_gun;
			temp_weapon.spread_number = 3;
		}else if gunname_string = "拳头枪" {
			var temp_weapon = obj_player.puncher_gun;
			temp_weapon.ammo[0].spd += 8;
		}else if gunname_string = "维和者"  or gunname_string = "维和者" 
		or gunname_string = "维和者"  or gunname_string = "维和者"
		or gunname_string = "维和者" or gunname_string = "维和者" {
			var temp_weapon = obj_player.sixshooter_gun;
			temp_weapon.reset_momentum = true;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
			with obj_player {
				switch(sixshooter_gun.bullets_per_bounce) {
					case 7: sixshooter_gun._name = "维和者"; break;
					case 8: sixshooter_gun._name = "维和者"; break;
					case 9: sixshooter_gun._name = "维和者"; break; 
					case 10: sixshooter_gun._name = "维和者"; break;
					case 11: sixshooter_gun._name = "维和者"; break;
					default: sixshooter_gun._name = "维和者"; break;
				}
			}
		}else if gunname_string = "弹球枪" {
			var temp_weapon = obj_player.bouncyball_gun;
			temp_weapon.ammo[0].num_of_bounces += 1;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "回旋镖" {
			var temp_weapon = obj_player.boomerang_gun;
			temp_weapon.ammo[0].spd += 2;
		}else if gunname_string = "小黄鸭水枪" {
			var temp_weapon = obj_player.water_gun;
			temp_weapon.bullets_per_bounce = 45;
			temp_weapon.current_bullets = round(temp_weapon.current_bullets);
		}else if gunname_string = "机关枪" {
			var temp_weapon = obj_player.machine_gun;
			temp_weapon.ammo[0].firerate_start = 8;
			temp_weapon.inaccuracy = 10;
		}else if gunname_string = "手雷发射器" {
			var temp_weapon = obj_player.grenade_gun;
			temp_weapon.momentum_added += 0.1;
			temp_weapon.ammo[0].spd += 1;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "吸星者" {
			var temp_weapon = obj_player.starsucker_gun;
			temp_weapon.spread_number = 14;
		}else if gunname_string = "悠悠球" {
			var temp_weapon = obj_player.yoyo_gun;
			temp_weapon.ammo[0].sprite = spr_projectile_yoyo2;
			temp_weapon.ammo[0].damage += 4;
		}else if gunname_string = "泡泡枪" {
			var temp_weapon = obj_player.bubble_gun;
			temp_weapon.bullets_per_bounce += 12;
			temp_weapon.current_bullets += 12;
		}else if gunname_string = "史莱姆发射器" {
			var temp_weapon = obj_player.slime_gun;
			temp_weapon.spread_number += 30;
		}else if gunname_string = "狙击枪" {
			var temp_weapon = obj_player.sniper_gun;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "等离子炮" {
			var temp_weapon = obj_player.plasma_gun;
		}else if gunname_string = "量子冲天炮" {
			var temp_weapon = obj_player.laser_gun;
			temp_weapon.bullets_per_bounce += 75;
			temp_weapon.current_bullets += 75;
		}else if gunname_string = "导弹发射器" {
			var temp_weapon = obj_player.missile_gun;
			temp_weapon.ammo[0].damage += 8;
		}else if gunname_string = "雪球加农炮" {
			var temp_weapon = obj_player.snow_gun;
			temp_weapon.ammo[0].spd += 4;
			temp_weapon.ammo[0].grv -= 0.03;
			temp_weapon.momentum_added += 0.05;
			temp_weapon.ammo[0].damage += 2;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "气球枪" {
			var temp_weapon = obj_player.balloon_gun;
		}else if gunname_string = "磁力飞轮" {
			var temp_weapon = obj_player.frisbee_gun;
			temp_weapon.ammo[0].sprite = spr_projectile_frisbee_large;
			temp_weapon.ammo[0].damage += 4;
			temp_weapon.ammo[0].spd += 2;
		}else if gunname_string = "追踪飞镖" {
			var temp_weapon = obj_player.dart_gun;
			temp_weapon.ammo[0].spd += 2;
		}
		#endregion
	}else if level = 3 {
		#region //Level 3
		if gunname_string = "手枪" {
			var temp_weapon = obj_player.default_gun;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
			temp_weapon.ammo[0].spd += 6;
		}else if gunname_string = "彩弹枪" {
			var temp_weapon = obj_player.paintball_gun;
			temp_weapon.firerate_start = 4;             
			temp_weapon.firerate_end = 4;
			temp_weapon.firerate = 4;
			temp_weapon.bullets_per_bounce += 2;
			temp_weapon.current_bullets += 2;
			temp_weapon.ammo[0].spd += 2;
			temp_weapon.ammo[0].damage += 2;
		}else if gunname_string = "霰弹枪" {
			var temp_weapon = obj_player.shotgun_gun;
			temp_weapon.ammo[0].destroy_time = 15;
			temp_weapon.spread_number = 11;
		}else if gunname_string = "脉冲步枪" {
			var temp_weapon = obj_player.burstfire_gun;
			temp_weapon.bullets_per_bounce += round(temp_weapon.bullets_per_bounce / temp_weapon.burst_number);
			temp_weapon.current_bullets += round(temp_weapon.bullets_per_bounce / temp_weapon.burst_number);
			temp_weapon.burst_number = 5;
			temp_weapon.current_burst = 0;
			temp_weapon.sound = snd_burstfire3;
			temp_weapon.burst_delay = 4;
			/*
			temp_weapon.bullets_per_bounce += 3;
			temp_weapon.current_bullets += 3;
			temp_weapon.burst_number = 5;
			temp_weapon.current_burst = 0;
			temp_weapon.sound = snd_burstfire3;
			temp_weapon.bullets_per_bounce += 5;
			temp_weapon.current_bullets +=  5;
			temp_weapon.burst_delay = 4;*/
		}else if gunname_string = "标枪" {
			var temp_weapon = obj_player.javelin_gun;
		}else if gunname_string = "拳头枪" {
			var temp_weapon = obj_player.puncher_gun;
			temp_weapon.ammo[0].spd += 8;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "维和者"  or gunname_string = "维和者" 
		or gunname_string = "维和者"  or gunname_string = "维和者"
		or gunname_string = "维和者" or gunname_string = "维和者" {
			var temp_weapon = obj_player.sixshooter_gun;
			temp_weapon.reset_momentum = true;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
			temp_weapon.momentum_added += 0.2;
			with obj_player {
				switch(sixshooter_gun.bullets_per_bounce) {
					case 7: sixshooter_gun._name = "维和者"; break;
					case 8: sixshooter_gun._name = "维和者"; break;
					case 9: sixshooter_gun._name = "维和者"; break; 
					case 10: sixshooter_gun._name = "维和者"; break;
					case 11: sixshooter_gun._name = "维和者"; break;
					default: sixshooter_gun._name = "维和者"; break;
				}
			}
		}else if gunname_string = "弹球枪" {
			var temp_weapon = obj_player.bouncyball_gun;
			temp_weapon.ammo[0].num_of_bounces += 1;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "回旋镖" {
			var temp_weapon = obj_player.boomerang_gun;
			temp_weapon.ammo[0].spd += 4;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "小黄鸭水枪" {
			var temp_weapon = obj_player.water_gun;
			temp_weapon.current_bullets = round(temp_weapon.current_bullets);
		}else if gunname_string = "机关枪" {
			var temp_weapon = obj_player.machine_gun;
			temp_weapon.ammo[0].firerate_start = 6;
			temp_weapon.inaccuracy = 5;
		}else if gunname_string = "手雷发射器" {
			var temp_weapon = obj_player.grenade_gun;
			temp_weapon.spread_number = 2;
		}else if gunname_string = "吸星者" {
			var temp_weapon = obj_player.starsucker_gun;
			temp_weapon.spread_number = 26;
		}else if gunname_string = "悠悠球" {
			var temp_weapon = obj_player.yoyo_gun;
		}else if gunname_string = "泡泡枪" {
			var temp_weapon = obj_player.bubble_gun;
			temp_weapon.bullets_per_bounce += 12;
			temp_weapon.current_bullets += 12;
			temp_weapon.firerate_start = 1;
			temp_weapon.firerate_end = 1;
			temp_weapon.firerate = 1;        
		}else if gunname_string = "雪球加农炮" {
			var temp_weapon = obj_player.snow_gun;
				temp_weapon.bullets_per_bounce += 1;
				temp_weapon.current_bullets += 1;
				temp_weapon.ammo[0].spd += 2;
				temp_weapon.ammo[0].damage += 2;
				temp_weapon.momentum_added += 0.075;
		}else if gunname_string = "气球枪" {
			var temp_weapon = obj_player.balloon_gun;
			temp_weapon.bullets_per_bounce += 20;
			temp_weapon.current_bullets += 20;
		}else if gunname_string = "磁力飞轮" {
			var temp_weapon = obj_player.frisbee_gun;
			temp_weapon.spread_number = 2;
		}else if gunname_string = "追踪飞镖" {
			var temp_weapon = obj_player.dart_gun;
			temp_weapon.spread_number = 2;
			temp_weapon.ammo[0].damage -= 2;
		}
		#endregion
	}else if level = 4 {
		#region //Level 4
		if gunname_string = "手枪" {
			var temp_weapon = obj_player.default_gun;
			temp_weapon.spread_number = 3;
			temp_weapon.ammo[0].spd += 2;
			temp_weapon.spread_angle = 25;
		}else if gunname_string = "彩弹枪" {
			var temp_weapon = obj_player.paintball_gun;
			temp_weapon.firerate_start = 3;             
			temp_weapon.firerate_end = 3;
			temp_weapon.firerate = 3;  
			temp_weapon.bullets_per_bounce += 3;
			temp_weapon.current_bullets += 3;
			temp_weapon.ammo[0].spd += 2;
			temp_weapon.ammo[0].damage += 2;
		}else if gunname_string = "霰弹枪" {
			var temp_weapon = obj_player.shotgun_gun;
			temp_weapon.spread_number = 16;
			temp_weapon.spread_angle = 10;
		}else if gunname_string = "脉冲步枪" {
			var temp_weapon = obj_player.burstfire_gun;
			temp_weapon.spread_number = 3;
			temp_weapon.spread_angle = 15;
		}else if gunname_string = "标枪" {
			var temp_weapon = obj_player.javelin_gun;
			temp_weapon.spread_number = 5;
			temp_weapon.spread_angle = 30;
		}else if gunname_string = "拳头枪" {
			var temp_weapon = obj_player.puncher_gun;
			temp_weapon.ammo[0].spd += 4;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "维和者"  or gunname_string = "维和者" 
		or gunname_string = "维和者"  or gunname_string = "维和者"
		or gunname_string = "维和者" or gunname_string = "维和者" {
			var temp_weapon = obj_player.sixshooter_gun;
			temp_weapon.reset_momentum = true;
			temp_weapon.bullets_per_bounce = 11;
			temp_weapon.current_bullets = 11;
			temp_weapon.momentum_added += 0.4;
			temp_weapon._name = "维和者";
			temp_weapon.inaccuracy = 0;
		}else if gunname_string = "弹球枪" {
			var temp_weapon = obj_player.bouncyball_gun;
			temp_weapon.ammo[0].num_of_bounces += 1;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
		}else if gunname_string = "回旋镖" {
			var temp_weapon = obj_player.boomerang_gun;
			temp_weapon.bullets_per_bounce += 1;
			temp_weapon.current_bullets += 1;
			temp_weapon.ammo[0].spd += 4;
		}else if gunname_string = "小黄鸭水枪" {
			var temp_weapon = obj_player.water_gun;
			temp_weapon.bullets_per_bounce = 60;
			temp_weapon.current_bullets = round(temp_weapon.current_bullets);
		}else if gunname_string = "雪球加农炮" {
			var temp_weapon = obj_player.snow_gun;
			temp_weapon.spread_number = 3;
			temp_weapon.spread_angle = 45;
		}else if gunname_string = "气球枪" {
			var temp_weapon = obj_player.balloon_gun;
			temp_weapon.spread_number = 2;
			temp_weapon.spread_angle = 90;
		}
		#endregion
	}
}