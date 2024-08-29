/// @description create snowballs
alarm[1] = 3;
if instance_exists(obj_camera) {
	if slow_down = false {
		repeat(10) {
			randomize();
			instance_create_depth(obj_camera.x - (obj_camera.view_w_half) + irandom_range(-(768/2),768*4),obj_camera.y - (obj_camera.view_h_half) - irandom_range(32,432),obj_player.depth-1,obj_snowball);
		}
	}else {
		repeat(round(snowball_speed)) {
			randomize();
			instance_create_depth(obj_camera.x - (obj_camera.view_w_half) + irandom_range(-(768/2),768*4),obj_camera.y - (obj_camera.view_h_half) - irandom_range(32,432),obj_player.depth-1,obj_snowball);
		}
	}
}
random_set_seed(global.seed);