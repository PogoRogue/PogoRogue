// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Enemy_Collision_Check(condition){
	var condition2 = false;
	with obj_shieldbubble_mask {
		if place_meeting(x,y+obj_player.vspeed,obj_enemy_parent) and parent_obj.not_colliding = true and obj_player.vspeed > 0 {
		
			with instance_place(x,y+obj_player.vspeed,obj_enemy_parent) {
				if (!is_dead && current_iframes <= 0) and obj_player.msk_index.colliding_with_enemies = false or obj_player.vspeed > 0 {
					if obj_player.state != obj_player.state_chargejump {
						obj_player.state = obj_player.state_bouncing;
					}
					obj_player.speed = 0;
					if obj_player.vsp_basicjump < -7 { //check if state = state_groundpound
						obj_player.pickup_groundpound.cooldown_time = 0;
					}
					speed = 0;
					hp -= obj_player.stomp_damage * stomp_defense;
					red_frames = 10;
					bounced_times += 1;
					other.parent_obj.bouncing = true;
					other.parent_obj.bouncing_bottom = true;
					
					randomize();
					audio_play_sound(choose(snd_enemyhurt,snd_enemyhurt2,snd_enemyhurt3),0,false);
					random_set_seed(global.seed);
					
					// For Sphere boss, change its direction when you hit it from above
					if(object_index == obj_boss_sphere) {
						var _angle_to_player = point_direction(x, y, obj_player.x, obj_player.y)
						if(_angle_to_player >= 35 && _angle_to_player <= 145) {
							vspeed = 1;
						}
					}
					
					// Do the same for any bricks attached to the sphere boss
					if(object_get_parent(object_index) == obj_boss_brick) {
						var _angle_to_player = point_direction(boss.x, boss.y, obj_player.x, obj_player.y)
						if(_angle_to_player >= 35 && _angle_to_player <= 145) {
							with(obj_boss_sphere) {
								vspeed = 1;
							}
						}
					}
					
					if hp <= 0 {
						obj_player.landed_on_enemy = true; // enable for robbery 
					}
				}else if obj_player.msk_index.colliding_with_enemies = false or obj_player.vspeed > 0 {
					if obj_player.state != obj_player.state_chargejump {
						obj_player.state = obj_player.state_bouncing;
					}
					obj_player.speed = 0;	
				}
			}
		}
	}
	if place_meeting(x,y+vspeed,obj_enemy_parent) and condition = true and free = true and current_iframes <= 0 {
		if instance_place(x,y+vspeed,obj_enemy_parent).is_dead = false {
			while !(place_meeting(x,y+sign(vspeed),obj_enemy_parent)) and (place_meeting(x,y+vspeed,obj_enemy_parent)) {
				y += sign(vspeed);
			}
			
			free = false;
			with instance_place(x,y+1,obj_enemy_parent) {
				if (!is_dead && current_iframes <= 0) and other.msk_index.colliding_with_enemies = false or other.vspeed > 0 {
					if other.state != other.state_chargejump and obj_player.state != obj_player.state_megabounce and obj_player.state != obj_player.state_megabounce_charge {
						other.state = other.state_bouncing;
					}
					if (obj_player.state = obj_player.state_megabounce or obj_player.state = obj_player.state_megabounce_charge) {
						freeze_x = x;
						freeze_y = y;
						freeze_frame = image_index;
						megabounce_freeze = true;
						other.pickup_megabounce.cooldown_time = 0;
					}
					other.speed = 0;
					if other.vsp_basicjump < -7 { //check if state = state_groundpound
						other.pickup_groundpound.cooldown_time = 0;
					}
					hp -= other.stomp_damage * stomp_defense;
					red_frames = 10;
					bounced_times += 1;
					
					randomize();
					audio_play_sound(choose(snd_enemyhurt,snd_enemyhurt2,snd_enemyhurt3),0,false);
					random_set_seed(global.seed);
					
					// For Sphere boss, change its direction when you hit it from above
					if(object_index == obj_boss_sphere) {
						var _angle_to_player = point_direction(x, y, other.x, other.y)
						if(_angle_to_player >= 35 && _angle_to_player <= 145) {
							vspeed = 1;
						}
					}
					
					// Do the same for any bricks attached to the sphere boss
					if(object_get_parent(object_index) == obj_boss_brick) {
						var _angle_to_player = point_direction(boss.x, boss.y, other.x, other.y)
						if(_angle_to_player >= 35 && _angle_to_player <= 145) {
							with(obj_boss_sphere) {
								vspeed = 1;
							}
						}
					}
					
					if hp <= 0 {
						other.landed_on_enemy = true; // enable for robbery 
					}
				}else if other.msk_index.colliding_with_enemies = false or other.vspeed > 0 {
					if other.state != other.state_chargejump {
						other.state = other.state_bouncing;
					}
					other.speed = 0;	
				}
			}
		}
	}
}