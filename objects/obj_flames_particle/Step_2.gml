if floor(image_index) >= sprite_get_number(sprite_index)-3 {
	instance_destroy();	
}
if distance_traveled_frames < 12 {
	if obj_player.angle = 0 and obj_player.image_xscale = -1 {
		x = obj_player.x - x_diff + lengthdir_x(distance*distance_traveled_frames,obj_player.angle-90);
		y = obj_player.y - y_diff + lengthdir_y(distance*distance_traveled_frames,obj_player.angle-90);
	}else {
		x = obj_player.x - x_diff + lengthdir_x(distance*distance_traveled_frames,obj_player.angle-90);
		y = obj_player.y - y_diff + lengthdir_y(distance*distance_traveled_frames,obj_player.angle-90);
	}
	distance_traveled_frames += 1;
}
/*
if !instance_exists(obj_player_flames_upward) {
	instance_destroy();	
}