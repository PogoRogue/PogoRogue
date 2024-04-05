alpha = 0.5;
decrease_alpha = false;
alarm[0] = 5;
damage = 6;
reset = false;

with obj_enemy_parent {
	if bbox_right > obj_camera.x - obj_camera.view_w_half and bbox_left < obj_camera.x + obj_camera.view_w_half
	and bbox_bottom > obj_camera.y - obj_camera.view_h_half and bbox_top < obj_camera.y + obj_camera.view_h_half {
		hp -= other.damage;
		if hp <= 0 {
			with obj_player {
				pickup_camera.on_cooldown = true;
				if obj_camera_pickup.reset = false {
					pickup_camera.cooldown_time = pickup_camera.max_cooldown_time - 240;
					obj_camera_pickup.reset = true;
				}else {
					if pickup_camera.cooldown_time > 0 {
						pickup_camera.cooldown_time -= 240;
					}else {
						pickup_camera.cooldown_time = 0;	
					}
				}
				scr_Reload_On_Kill();
			}
		}
	}
}