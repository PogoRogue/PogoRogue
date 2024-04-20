// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Reload_On_Kill() {
	// Don't reload for boss bricks or inactive turrets
	if(object_get_parent(other.object_index) == obj_boss_brick) return;
	if(other.object_index == obj_enemy_turret_unkillable && !other.is_active) return;
	
	if other.hp <= 0 {
		with other {
			if (created_items = false) {
				Create_Item_Drops(random_items);
				created_items = true;
			}
		}
		with obj_player {
			if (global.psychicbullets) {
				for(var i = 0; i < array_length(gun_array); i++){
					var gun_temp = gun_array[i];
					if gun_temp.current_bullets != gun_temp.bullets_per_bounce {
						audio_play_sound(snd_reload,0,false);
						instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);	
						gun_temp.current_bullets = gun_temp.bullets_per_bounce;
					}
				}
			}else if gun.current_bullets < gun.bullets_per_bounce+obj_player.max_ammo_buff and gun != boomerang_gun {
				gun.current_bullets = gun.bullets_per_bounce+obj_player.max_ammo_buff; //reload bullets	
	
				instance_create_depth(x+lengthdir_x(16,image_angle+90),y+lengthdir_y(16,image_angle+90),depth-1,obj_bulletcasing);
				audio_play_sound(snd_reload,0,false);
			}
			global.water_index += 1;
		}
		//reload hat gun on hat gun kill
		if object_get_name(object_index) = "obj_projectile"  {
			//if (gun_name = "Hat Gun") {
				with obj_player {
					pickup_hatgun.uses_per_bounce = pickup_hatgun.max_uses_per_bounce;
					pickup_hatgun.on_cooldown = false;
				}
			//}
		}
	}
}