// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Enemy_Collision_Check(condition){
	if place_meeting(x,y+vspeed,obj_enemy_parent) and condition = true and free = true {
		if instance_place(x,y+vspeed,obj_enemy_parent).is_dead = false {
			while !(place_meeting(x,y+sign(vspeed),obj_enemy_parent)) and (place_meeting(x,y+vspeed,obj_enemy_parent)) {
				y += sign(vspeed);
			}
			
			free = false;
			with instance_place(x,y+1,obj_enemy_parent) {
				if (!is_dead && current_iframes <= 0) and other.msk_index.colliding_with_enemies = false or other.vspeed > 0 {
					if other.state != other.state_chargejump {
						other.state = other.state_bouncing;
					}
					other.speed = 0;
					if other.vsp_basicjump < -7 { //check if state = state_groundpound
						other.pickup_groundpound.cooldown_time = 0;
					}
					hp -= other.stomp_damage * stomp_defense;
					red_frames = 10;
					
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