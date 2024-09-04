/// @description Damage enemy

if(!other.is_dead) {
	other.hp -= damage;
	other.red_frames = 10;
	
	scr_Reload_On_Kill();
}
mask_index = spr_nothing;