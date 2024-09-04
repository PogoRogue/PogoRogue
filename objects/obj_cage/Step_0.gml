if global.skins_unlocked_array[skin_num-1] = true {
	image_alpha = 0;
	mask_index = spr_nothing;
}else {
	image_alpha = 1;
	mask_index = sprite_index;
}