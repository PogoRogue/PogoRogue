/// @description Point arm towards player

if(!instance_exists(parent)) {
	instance_destroy(self);
	exit;
}

x = parent.x + lengthdir_x(length_diff, parent.image_angle + angle_diff);
y = parent.y + lengthdir_y(length_diff, parent.image_angle + angle_diff);

if !instance_exists(obj_enemy_laser) {
	if boss.weapon = BOSS3_WEAPONS.LASER {
		var turn_speed = 30 / 100000;
		var accuracy = 1;
		accuracy = clamp(accuracy, 0.05, 1);    // Don't want perfect accuracy or perfect inaccuracy
		accuracy = abs(accuracy - 1.0);
		// Get the target direction and facing direction
		var target_dir = point_direction(x, y, target.x, target.y + 300);
		var facing_dir = image_angle;

		// Calculate the difference between target direction and facing direction
		var facing_minus_target = facing_dir - target_dir;
		var angle_diff2 = facing_minus_target;
		if(abs(facing_minus_target) > 180) {
		    if(facing_dir > target_dir) {
		        angle_diff2 = -1 * ((360 - facing_dir) + target_dir);
		    }
		    else {
		        angle_diff2 = (360 - target_dir) + facing_dir;
		    }
		}
	
		var least_accurate_aim = 5;
		//image_angle = point_direction(x, y, target.x, target.y + 64);
		var draw_laser2 = false;
		with obj_boss_marionette_forearm {
			if draw_laser = true {
				draw_laser2 = true;
			}
		}
		if instance_exists(forearm) {
			if draw_laser2 = false {
				if(angle_diff2 > least_accurate_aim * accuracy ) and (abs(angle_diff2) - abs(least_accurate_aim)) >= 5 {
				    image_angle -= turn_speed * delta_time;
				} else if(angle_diff2 < least_accurate_aim * accuracy) and (abs(angle_diff2) - abs(least_accurate_aim)) >= 5 {
				    image_angle += turn_speed * delta_time;
				}
			}
		}
	}else {
		image_angle = point_direction(x, y, target.x, target.y + 300);	
	}
}

if(arm_num == 1) {
	// Right arm
	if(target.x < x) {
		depth = initial_depth + 1;
	} else {
		depth = initial_depth;
	}
} else if (arm_num == 2) {
	// Left arm
	if(target.x > x) {
		depth = initial_depth + 1;
	} else {
		depth = initial_depth;
	}
}
