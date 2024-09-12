/// @description create nuke

image_index = 1;
alarm[0] = 5;
alarm[5] = 180;

xoffset = 0;
yoffset = 0;
enemy_following_obj = noone;
if place_meeting(x,y,obj_enemy_parent) {
	enemy_following_obj = instance_place(x,y,obj_enemy_parent);
	xoffset = enemy_following_obj.x-x;
	yoffset = enemy_following_obj.y-y;
}

randomize();
gap = 64;

random_side_x = choose(-1,1);
random_side_y = choose(-1,1);
choose_range_x = irandom_range(-416,416);
choose_range_y = irandom_range(-248,248);
spawn_x = choose(true,false);
if instance_exists(obj_camera) {
	if spawn_x = true {
		//instance_create_depth(obj_camera.x+((obj_camera.view_w_half+gap)*random_side_x)+choose_range_x,obj_camera.y+((obj_camera.view_h_half+gap)*random_side_y),depth-1,obj_nuke);
		with instance_create_depth(obj_camera.x+((obj_camera.view_w_half+gap)*random_side_x)+choose_range_x,obj_camera.y+((obj_camera.view_h_half+gap)*random_side_y),depth-1,obj_nuke) {
			target_obj = other;
		}
	}else {
		//instance_create_depth(obj_camera.x+((obj_camera.view_w_half+gap)*random_side_x),obj_camera.y+((obj_camera.view_h_half+gap)*random_side_y)+choose_range_y,depth-1,obj_nuke);
		with instance_create_depth(obj_camera.x+((obj_camera.view_w_half+gap)*random_side_x),obj_camera.y+((obj_camera.view_h_half+gap)*random_side_y)+choose_range_y,depth-1,obj_nuke) {
			target_obj = other;
		}
	}
}
random_set_seed(global.seed);

audio_play_sound(snd_rocketwhoosh,0,false);

//update center position
center_x_sprite = bbox_left + ((bbox_right - bbox_left)/2);
center_y_sprite = bbox_top + ((bbox_bottom - bbox_top)/2);