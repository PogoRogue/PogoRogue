/// @description damage enemy

if(!other.is_dead && !array_contains(damaged_list, other)) {
	other.hp -= damage;
	other.red_frames = 10;
	if other.hp <= 0 {
		if chargejump = true {
			obj_player.pickup_chargejump.cooldown_time = 0;	
		}else {
			with obj_player {
				pickup_firedash.on_cooldown = true;
				if obj_player_flames_upward.reset = false {
					pickup_firedash.cooldown_time = pickup_firedash.max_cooldown_time - 240;
					pickup_dragster.cooldown_time = pickup_dragster.max_cooldown_time - 240;
					obj_player_flames_upward.reset = true;
				}else {
					if pickup_firedash.cooldown_time > 0 {
						pickup_firedash.cooldown_time -= 240;
					}else {
						pickup_firedash.cooldown_time = 0;	
					}
					
					if pickup_dragster.cooldown_time > 0 {
						pickup_dragster.cooldown_time -= 240;
					}else {
						pickup_dragster.cooldown_time = 0;	
					}
				}
			}
		}
	}
	scr_Reload_On_Kill();
	damaged_list = array_concat(damaged_list, [other]);
}