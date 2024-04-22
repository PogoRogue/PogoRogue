/// @description Damage enemy
if(boss_projectile==false){
if(!other.invinsible) and damage != 0 {
    var laser_damage = 0.9; //apply damage buff differently for laser
	var slime_damage = 0.7; //apply damage buff differently for slime
	
	if gun_name = "Sniper Rifle" {
		if !scr_In_Array(sniped_array,other) {
			if(!other.is_dead) {
				other.hp -= (damage + global.damage_buff - (global.damage_buff * laser_damage * (gun_name = "Laser Gun" and global.damage_buff > 0)) - (global.damage_buff * slime_damage * (gun_name = "Slime Blaster" and global.damage_buff > 0))) * other.bullet_defense;
				other.red_frames = 10;
	
				scr_Reload_On_Kill();
			}
			sniped = true;
			sniped_array[array_length(sniped_array)] = other;
			with obj_projectile {
				if gun_name = "Sniper Rifle" {
					sniped_array = other.sniped_array;
				}
			}
		}
	}else if gun_name = "Yo-yo" {
		if !scr_In_Array(yoyo_array,other) and retracted = false {
			if(!other.is_dead) {
				other.hp -= (damage + global.damage_buff - (global.damage_buff * laser_damage * (gun_name = "Laser Gun" and global.damage_buff > 0)) - (global.damage_buff * slime_damage * (gun_name = "Slime Blaster" and global.damage_buff > 0))) * other.bullet_defense;
				other.red_frames = 10;
	
				scr_Reload_On_Kill();
			}
			yoyo_array[array_length(yoyo_array)] = other;
		}
		if !scr_In_Array(yoyo_array2,other) and retracted = true {
			if(!other.is_dead) {
				other.hp -= (damage + global.damage_buff - (global.damage_buff * laser_damage * (gun_name = "Laser Gun" and global.damage_buff > 0)) - (global.damage_buff * slime_damage * (gun_name = "Slime Blaster" and global.damage_buff > 0))) * other.bullet_defense;
				other.red_frames = 10;
	
				scr_Reload_On_Kill();
			}
			yoyo_array2[array_length(yoyo_array2)] = other;
		}
	}else {
		if(!other.is_dead) {
			other.hp -= (damage + global.damage_buff - (global.damage_buff * laser_damage * (gun_name = "Laser Gun" and global.damage_buff > 0)) - (global.damage_buff * slime_damage * (gun_name = "Slime Blaster" and global.damage_buff > 0))) * other.bullet_defense;
			other.red_frames = 10;
	
			scr_Reload_On_Kill();
		}
	}
	
	if (destroy_on_impact) or (gun_name = "Missile Launcher") or (gun_name = "Bullet Blast") or (gun_name = "Javelins") {
		instance_destroy();
	}

	colliding_with_enemy = true;
	
}
}