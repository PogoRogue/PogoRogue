/// @description Damage enemy
if(!other.is_dead) {
	other.hp -= (damage + (obj_player.damage_buff/10)) * other.bullet_defense;
	other.red_frames = 10;
	
	scr_Reload_On_Kill();
}