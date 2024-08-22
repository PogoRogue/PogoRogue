if launched = true {
	x += hspd;
	y += vspd;

	//cant damage enemies if out of view
	if instance_exists(obj_camera) {
		var camera_width = camera_get_view_width(view_camera[0])/2;
		var camera_height = camera_get_view_height(view_camera[0])/2;
		var padding = 128;

		if !(point_in_rectangle(x,y,obj_camera.x-camera_width-padding,obj_camera.y-camera_height-padding,obj_camera.x+camera_width+padding,obj_camera.y+camera_height+padding)) {
			damage = 0;
		}else {
			damage = init_damage;
		}
	
		//destroy if far enough away from camera
		if  !(point_in_rectangle(x,y,obj_camera.x-camera_width-(padding*10),obj_camera.y-camera_height-(padding*10),obj_camera.x+camera_width+(padding*10),obj_camera.y+camera_height+(padding*10))) {
			instance_destroy();
		}
	}

	//destroy when touching ground
	if (destroy_on_impact and num_of_bounces <= 0 and destroyable = true) {
		if (place_meeting(x,y,obj_ground)) and global.drilltipbullets = false
		or (place_meeting(x,y,obj_boss_sequence)) and global.drilltipbullets = false and instance_place(x,y,obj_boss_sequence).image_index != 5 {
			alarm[0] = 1;
		}
	}

	//gravity
	if (grav_affected) {
		vspd += grv;	
	}

	//missile
	if (gun_name = "Missile Launcher") {
		//speed up
		if speed < 8 {
			speed += 8;	
		}
	
		//lock on to enemy
		if collision_circle(x,y,700,obj_enemy_parent,false,true) != noone {
			if instance_nearest(x,y,obj_enemy_parent).is_dead = false {
				closest_enemy = instance_nearest(x,y,obj_enemy_parent);
				closest_enemy.locked_onto = true;
			}else if closest_enemy = noone {
				with obj_enemy_parent {
					if distance_to_object(other) < 700 and locked_onto = false and is_dead = false {
						other.closest_enemy = self;
					}
				}
			}
		}else {
			closest_enemy = noone;
		}
	
		//rotate
		if closest_enemy != noone {
			//num_of_bounces = 0;
			damage = init_damage;
			scr_Gradually_Turn(self.id,closest_enemy,60,1);
			direction = image_angle;
			if place_meeting(x,y,closest_enemy) {
				instance_destroy();	
			}
		}else {
			direction = image_angle;
		
			if place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y,obj_ground_oneway) and vspeed > 0 {
				instance_destroy();	
			}
		}
	}

	if destroyable = false and !place_meeting(x,y,obj_ground) {
		destroyable = true;	
	}
	mask_index = sprite_index;
}else {
	mask_index = spr_nothing;	
}