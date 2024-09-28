/// @description Player collision + button pressed

key_interact = global.key_interact;
key_back = global.key_back;
key_left = global.key_left_menu;
key_right = global.key_right_menu;
key_select = global.key_select;

if obj_player.num_of_weapons = 1 {
	select_x_max = obj_player.num_of_weapons;
}else if obj_player.num_of_weapons = 2 and obj_player.gun_1 != obj_player.gun_2 {
	select_x_max = obj_player.num_of_weapons;
}else if obj_player.num_of_weapons = 3 and obj_player.gun_1 != obj_player.gun_2 and obj_player.gun_1 != obj_player.gun_3 and obj_player.gun_2 != obj_player.gun_3 {
	select_x_max = obj_player.num_of_weapons;
}else {
	if obj_player.gun_1 = obj_player.gun_2 and obj_player.gun_1 = obj_player.gun_3 and obj_player.gun_2 = obj_player.gun_3 {
		select_x_max = 1;
	}else if obj_player.gun_1 != obj_player.gun_2 and (obj_player.gun_1 = obj_player.gun_3 or obj_player.gun_2 = obj_player.gun_3) {
		select_x_max = 2;
	}else {
		select_x_max = 2;
	}
}


//check for player coliision
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) {
	colliding = true;
	show_debug_message("COLLIDING");
}else {
	colliding = false;	
}

if (colliding and key_interact) and !instance_exists(obj_fade_in) {
	being_used = not being_used;
	obj_player.can_rotate = true;
	obj_player.centering = true;
	obj_player.table = being_used;
}

if being_used = true {
	obj_player.table = true;
	if !instance_exists(obj_pogostick) {
		instance_create_depth(obj_player.x,obj_player.y,obj_player.depth+1,obj_pogostick,{image_angle: obj_player.image_angle});	
	}
	obj_player.state = obj_player.state_pogosmith;
	if instance_exists(obj_camera) {
		obj_camera.follow = self;
	}
	obj_player.can_rotate = false;
	obj_player.can_shoot = false;
	
	if distance_to_object(obj_player) > 128 or key_back {
		being_used = false;
		if instance_exists(obj_camera) {
			obj_camera.follow = obj_player;
		}
		obj_player.can_rotate = true;
		obj_player.table = false;
	}
	
	if key_right and !key_left and select_x < select_x_max-1 and !selected_x {
		audio_play_sound(snd_menuNavigation,0,false);
		selected_x = true;
		alarm[2] = alarm2_time;
		select_x += 1;
	}
	
	if !key_right and key_left and select_x > 0 and !selected_x {
		audio_play_sound(snd_menuNavigation,0,false);
		selected_x = true;
		alarm[2] = alarm2_time;
		select_x -= 1;
	}
	
	if !key_right and !key_left {
		selected_x = false;
		alarm2_time = 30;
	}
	
	if key_select and !(select_x = 0 and gun_1_bought = true) and !(select_x = 1 and gun_2_bought = true) and !(select_x = 2 and gun_3_bought = true) 
	and obj_player.gun_array[other.select_x].level < 4{
		if global.num_of_coins >= purchase_cost * obj_player.gun_array[other.select_x].level {
			sprite_index = spr_pogosmith_workbench_animation;
			image_speed = 1;
			image_index = 0;
			audio_play_sound(snd_pogosmith_upgrade,0,false);
			global.num_of_coins -= purchase_cost * obj_player.gun_array[other.select_x].level;
			//create coins
			with instance_create_depth(obj_player_mask.x,obj_player_mask.y,obj_player_mask.depth+10,obj_coin_spawner, {pogosmith_spawner: true}) {
				num_of_coins = other.purchase_cost * obj_player.gun_array[obj_player.current_gun].level;
				init_num_of_coins = other.purchase_cost * obj_player.gun_array[other.select_x].level;
			}
			obj_player.gun_array[other.select_x].level += 1;
			
			
			if test_mode = false {
				if select_x = 0 {
					gun_1_bought = true;
				}else if select_x = 1 {
					gun_2_bought = true;
				}else if select_x = 2 {
					gun_3_bought = true;
				}
			}else if test_mode = true {
				if select_x = 0 and obj_player.gun_array[0].level >= 4 {
					gun_1_bought = true;
				}else if select_x = 1 and obj_player.gun_array[1].level >= 4 {
					gun_2_bought = true;
				}else if select_x = 2 and obj_player.gun_array[2].level >= 4 {
					gun_3_bought = true;
				}
			}
		
			//upgrade weapon
			scr_Upgrade_Weapon(obj_player.gun_array[other.select_x]._name,obj_player.gun_array[other.select_x].level);
		}else {
			audio_play_sound(snd_unavailable,0,false);	
		}
	}
	
	if gun_1_bought = true {
		black_alpha_1 = 0.5;	
	}
	if gun_2_bought = true {
		black_alpha_2 = 0.5;	
	}
	if gun_3_bought = true {
		black_alpha_3 = 0.5;	
	}
	
	
	if purchase_cost * obj_player.gun_array[select_x].level > global.num_of_coins {
		upgrade_color = make_color_rgb(180,82,82);
		cost_color = make_color_rgb(180,82,82);
	}else if select_x = 0 and gun_1_bought = true {
		upgrade_color = make_color_rgb(180,82,82);
	}else if select_x = 1 and gun_2_bought = true {
		upgrade_color = make_color_rgb(180,82,82);
	}else if select_x = 2 and gun_3_bought = true {
		upgrade_color = make_color_rgb(180,82,82);
	}else {
		upgrade_color = make_color_rgb(242,240,229);
		cost_color = make_color_rgb(237,225,158);
	}
	
	if obj_player.gun_1 != init_gun_1 {
		init_gun_1 = obj_player.gun_1;
		gun_1_bought = false;
		black_alpha_1 = 0;
	}else if obj_player.gun_2 != init_gun_2 {
		init_gun_2 = obj_player.gun_2;
		gun_2_bought = false;
		black_alpha_2 = 0;
	}if obj_player.gun_3 != init_gun_3 {
		init_gun_3 = obj_player.gun_3;
		gun_3_bought = false;
		black_alpha_3 = 0;
	}
}

if scr_Animation_Complete() and sprite_index = spr_pogosmith_workbench_animation {
	image_speed = 0;
	sprite_index = spr_pogosmith_workbench;
	image_index = 0;
}