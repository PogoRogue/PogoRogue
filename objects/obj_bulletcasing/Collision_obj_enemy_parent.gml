if global.hot_shells = true and damaged = false {
	if(!other.is_dead) {
		other.hp -= (16 + obj_player.damage_buff) * other.bullet_defense;
		other.red_frames = 10;
		scr_Reload_On_Kill();
		damaged = true;
	}
}