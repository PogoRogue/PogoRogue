if scr_Animation_Complete() and sprite_index = spr_heart_energy_ui_gain {
	image_speed = 0;
	if heart_number = obj_player.max_energy_buff {
		with obj_heart_energy_gain {
			spawned = true;
		}
	}
	if spawned = true {
		sprite_index = spr_heart_energy_animation;
		image_index = 0;	
	}
}

x = 28 + (obj_player.max_hp/8 * 24) + (obj_player.armor_buff*24) + ((heart_number-1) * 24);

if sprite_index = spr_heart_energy_animation {
	if obj_player.energy_buff = heart_number {
		image_speed = 1;	
	}else if obj_player.energy_buff < heart_number {
		instance_destroy();
		instance_create_depth(x,y,depth,obj_heart_energy_lost);
		if heart_number = 1 {
			obj_player.pickup_jolt.on_cooldown = true;
			obj_player.pickup_jolt.cooldown_time = obj_player.pickup_jolt.max_cooldown_time;	
		}
	}
	
	if scr_Animation_Complete() {
		instance_destroy();
		instance_create_depth(x,y,depth,obj_heart_energy_lost);
		obj_player.energy_buff -= 1;
		if heart_number = 1 {
			obj_player.pickup_jolt.on_cooldown = true;
			obj_player.pickup_jolt.cooldown_time = obj_player.pickup_jolt.max_cooldown_time;	
		}
	}
}

