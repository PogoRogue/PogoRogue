/// @description Damage enemy
//crit chance
randomize();

var crit_chance = irandom_range(1,100);

if crit_chance > 100 - global.crit_percentage {
	var crit_dmg_mult = 2;
}else {
	var crit_dmg_mult = 1;
}
random_set_seed(global.seed);

if(boss_projectile==false){
if(!other.invinsible) and damage != 0 and other.hp > 0 {
    var laser_damage = 0.9; //apply damage buff differently for laser
	var slime_damage = 0.7; //apply damage buff differently for slime
	
	if(!other.is_dead) {
		other.hp -= (damage + global.damage_buff - (global.damage_buff * laser_damage * (gun_name = "Laser Gun" and global.damage_buff > 0)) - (global.damage_buff * slime_damage * (gun_name = "Slime Blaster" and global.damage_buff > 0))) * other.bullet_defense * crit_dmg_mult;
		other.red_frames = 10;
	
		scr_Reload_On_Kill();
	}
	if crit_chance > 100 - global.crit_percentage {
		instance_create_depth(x - (hspd*2),y - (vspd*2),depth,obj_criticalhit);
	}
	
	
	if (destroy_on_impact) or (gun_name = "Missile Launcher") or (gun_name = "Bullet Blast") or (gun_name = "Javelins") {
		alarm[0] = 1;
		//instance_destroy();
	}

	colliding_with_enemy = true;
}
}