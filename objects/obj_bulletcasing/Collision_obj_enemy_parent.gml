if global.hot_shells = true  {
	if exploding_chance <= 50 and exploded = false {
		exploded = true;
		instance_destroy();		
	}
}

/*if global.hot_shells = true and damaged = false {
	if(!other.is_dead) {
		other.hp -= (8 + obj_player.damage_buff) * other.bullet_defense;
		other.red_frames = 10;
		scr_Reload_On_Kill();
		damaged = true;
	}
}