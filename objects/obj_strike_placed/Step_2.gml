/// @description follow enemy
if instance_exists(enemy_following_obj) {
	x = enemy_following_obj.center_x_sprite;
	y = enemy_following_obj.center_y_sprite;
}

//update center position
center_x_sprite = bbox_left + ((bbox_right - bbox_left)/2);
center_y_sprite = bbox_top + ((bbox_bottom - bbox_top)/2);