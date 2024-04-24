/// @description Change sprite

if(vole_is_dead) {
	sprite_index = spr_background_minigame_win;
	image_index = min(image_index, sprite_get_number(spr_background_minigame_win) - 1);
}