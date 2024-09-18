/// @description take damage
if instance_exists(temp_collision_enemy) {
	pogostick_colliding = false;
	with temp_collision_enemy {
		if place_meeting(x,y,obj_player) {
			//other.pogostick_colliding = true;
		}
	}
	if pogostick_colliding = false {
		if temp_collision_enemy.red_frames = 0 {
			if parent_index.state != parent_index.state_portal and parent_index.state != parent_index.state_shop_portal
			and parent_index.harpooning = false {
				if(!temp_collision_enemy.is_dead && parent_index.current_iframes <= 0 && temp_collision_enemy.damage > 0) {
					scr_Player_Damaged(temp_collision_enemy.damage);
					show_debug_message(object_get_name(temp_collision_enemy.object_index));
				}
			}else if parent_index.state != parent_index.state_portal and parent_index.state != parent_index.state_shop_portal {
				//damage enemy when harpooning
				if(!temp_collision_enemy.is_dead) {
					temp_collision_enemy.hp -= (harpoon_dash_damage + global.damage_buff);
					temp_collision_enemy.red_frames = 10;
	
					scr_Reload_On_Kill();
				}
			}
		}
	}
}

temp_collision_enemy = noone;