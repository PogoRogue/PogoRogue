/// @description Draw turret body

// Inherit the parent event
event_inherited();
if(is_turret){

	draw_sprite_ext(spr_enemy_turret_base_new, 0, x, y, 1, 1, rotation, -1, image_alpha);

}
