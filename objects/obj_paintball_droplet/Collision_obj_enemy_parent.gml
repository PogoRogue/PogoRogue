/// @description Insert description here
// You can write your code in this editor

if deal_damage = true {
	if(!other.is_dead) {
		other.hp -= (damage + global.damage_buff) * other.bullet_defense;
		other.red_frames = 10;
	
		scr_Reload_On_Kill();
		instance_destroy();
	}
}