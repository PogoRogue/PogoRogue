/// @description Get damaged
if temp_collision_enemy = noone {
	temp_collision_enemy = other;
	alarm[4] = 5;
}
/*
//if room != room_starting_area {
	if parent_index.state != parent_index.state_portal and parent_index.state != parent_index.state_shop_portal
	and parent_index.harpooning = false {
		if(!other.is_dead && parent_index.current_iframes <= 0 && other.damage > 0) {
			scr_Player_Damaged(other.damage);
			show_debug_message(object_get_name(other.object_index));
		}
	}else if parent_index.state != parent_index.state_portal and parent_index.state != parent_index.state_shop_portal {
		//damage enemy when harpooning
		if(!other.is_dead) {
			other.hp -= (harpoon_dash_damage + global.damage_buff);
			other.red_frames = 10;
	
			scr_Reload_On_Kill();
		}
	}
//}