// Inherit the parent event
event_inherited();
pipe1 = noone; pipe2 = noone; pipe3 = noone; pipe4 = noone; pipe5 = noone;
pipe6 = noone; pipe7 = noone; pipe8 = noone; pipe9 = noone; pipe10 = noone;
with obj_pipe {
	switch (pipe_number) {
		case 1: other.pipe1 = self; break;
		case 2: other.pipe2 = self; break;
		case 3: other.pipe3 = self; break;
		case 4: other.pipe4 = self; break;
		case 5: other.pipe5 = self; break;
		case 6: other.pipe6 = self; break;
		case 7: other.pipe7 = self; break;
		case 8: other.pipe8 = self; break;
		case 9: other.pipe9 = self; break;
		case 10: other.pipe10 = self; break;
	}
}

hspd = 0;
vspd = 0;
jump_spd = -9.5;

red_frames = 0;

drop_coins= false;

heart_chance = 0; //percent
buff_chance = 0; //percent
pickup_chance = 0; //percent
weapon_chance = 0; //percent

poke_direction = "up";
state_switched = false;
dist_to_travel = 40;
dist_to_travel_poke = 40;
reached_end = false;
pause_time = 60;
pause_time_poke = 120;
delay = 0;
grav = 0.18;
current_pipe = 0;
can_fall = true;
shoot_spd = 8;
bounced_on = false;
is_bomb = false;
bullet_speed = 4;
jump_shot = false;
depth = 501;

hp = 96;
hp_max = hp;
draw_hp = false;
stomp_defense = 3;
shoot_defense = 1.5;
died = false;
death_x = x;
death_y = y;
current_bomb_hp = hp;

freeze = false;
megabounce_freeze = false; //dont despawn right away if killed by megabounce
freeze_x = x;
freeze_y = y;
freeze_frame = image_index;

init_sprite = sprite_index;

// Healthbar dimensions
view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
top_border = view_height - 20;
hp_percent = (hp / hp_max) * 100;

state_waiting = function() {
	if object_get_name(object_index) = "obj_boss_mole1" and !is_bomb {
		sprite_index = spr_mole1;
		image_speed = 0;
		image_index = 0;
	}else if object_get_name(object_index) = "obj_boss_mole2" and !is_bomb {
		sprite_index = spr_mole2;
		image_speed = 0;
		image_index = 0;
	}else if object_get_name(object_index) = "obj_boss_mole3" and !is_bomb {
		sprite_index = spr_mole3;
		image_speed = 0;
		image_index = 0;
	}
	if state_switched = true {
		state_switched = false;
		is_bomb = false;
		image_alpha = 1;
	}
}

state_poke = function() {
	if object_get_name(object_index) = "obj_boss_mole1" and !is_bomb {
		sprite_index = spr_mole1;
		image_speed = 0;
		image_index = 0;
	}else if object_get_name(object_index) = "obj_boss_mole2" and !is_bomb {
		sprite_index = spr_mole2;
		image_speed = 0;
		image_index = 0;
	}else if object_get_name(object_index) = "obj_boss_mole3" and !is_bomb {
		sprite_index = spr_mole3;
		image_speed = 0;
		image_index = 0;
	}
	if megabounce_freeze = false {
		freeze = false;
	}
	if state_switched = true {
		state_switched = false;
		dist_to_travel = dist_to_travel_poke;
		reached_end = false;
		pause_time = pause_time_poke;
		
		if bounced_on = true {
			bounced_on = false;
		}
	}
	
	if delay <= 0 and megabounce_freeze = false {
		if reached_end = false { // poking out
			if dist_to_travel > 0 {
				if poke_direction = "up" {
					y -= 2;
				}else if poke_direction = "down" {
					y += 2;
				}else if poke_direction = "left" {
					x += 2;
				}else if poke_direction = "right" {
					x -= 2;
				}
				dist_to_travel -= 2;
			}else {
				dist_to_travel = 0;
				if pause_time > 0 {
					pause_time -= 1;
				}else if poke_direction != "down" {
					if is_bomb = false {
						reached_end = true;
					}else {
						if object_get_name(object_index) = "obj_boss_mole1" {
							var projectile_sprite = spr_mole1_projectile;
						}else if object_get_name(object_index) = "obj_boss_mole2" {
							var projectile_sprite = spr_mole2_projectile;
						}else if object_get_name(object_index) = "obj_boss_mole3" {
							var projectile_sprite = spr_mole3_projectile;
						}else {
							var projectile_sprite = spr_mole1_projectile;
						}
						if floor(image_index) >= 11 {
							reached_end = true;
							image_alpha = 0;
							//explosion code here
							instance_create_depth(x,y,610,obj_explosion);
							if poke_direction = "up" {
								instance_create_depth(x,y-20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 0, sprite_index: projectile_sprite});
								instance_create_depth(x,y-20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 30, sprite_index: projectile_sprite});
								instance_create_depth(x,y-20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 60, sprite_index: projectile_sprite});
								instance_create_depth(x,y-20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 90, sprite_index: projectile_sprite});
								instance_create_depth(x,y-20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 120, sprite_index: projectile_sprite});
								instance_create_depth(x,y-20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 150, sprite_index: projectile_sprite});
								instance_create_depth(x,y-20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 180, sprite_index: projectile_sprite});
							}else if poke_direction = "left" {
								instance_create_depth(x+20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 0, sprite_index: projectile_sprite});
								instance_create_depth(x+20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 30, sprite_index: projectile_sprite});
								instance_create_depth(x+20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 60, sprite_index: projectile_sprite});
								instance_create_depth(x+20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 90, sprite_index: projectile_sprite});
								instance_create_depth(x+20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 270, sprite_index: projectile_sprite});
								instance_create_depth(x+20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 300, sprite_index: projectile_sprite});
								instance_create_depth(x+20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 330, sprite_index: projectile_sprite});
							}else if poke_direction = "right" {
								instance_create_depth(x-20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 90, sprite_index: projectile_sprite});
								instance_create_depth(x-20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 120, sprite_index: projectile_sprite});
								instance_create_depth(x-20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 150, sprite_index: projectile_sprite});
								instance_create_depth(x-20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 180, sprite_index: projectile_sprite});
								instance_create_depth(x-20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 210, sprite_index: projectile_sprite});
								instance_create_depth(x-20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 240, sprite_index: projectile_sprite});
								instance_create_depth(x-20,y,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 270, sprite_index: projectile_sprite});
							}
						}
					}
				}else {
					if is_bomb = false {
						if can_fall = true {
							state = state_fall;	
							state_switched = true;
						}else {
							reached_end = true;
						}
					}else {
						if object_get_name(object_index) = "obj_boss_mole1" {
							var projectile_sprite = spr_mole1_projectile;
						}else if object_get_name(object_index) = "obj_boss_mole2" {
							var projectile_sprite = spr_mole2_projectile;
						}else if object_get_name(object_index) = "obj_boss_mole3" {
							var projectile_sprite = spr_mole3_projectile;
						}else {
							var projectile_sprite = spr_mole1_projectile;
						}
						if floor(image_index) >= 11 {
							reached_end = true;
							image_alpha = 0;
							//explosion code here
							instance_create_depth(x,y,610,obj_explosion);
							instance_create_depth(x,y+20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 0, sprite_index: projectile_sprite});
							instance_create_depth(x,y+20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 180, sprite_index: projectile_sprite});
							instance_create_depth(x,y+20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 210, sprite_index: projectile_sprite});
							instance_create_depth(x,y+20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 240, sprite_index: projectile_sprite});
							instance_create_depth(x,y+20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 270, sprite_index: projectile_sprite});
							instance_create_depth(x,y+20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 300, sprite_index: projectile_sprite});
							instance_create_depth(x,y+20,depth+1,obj_boss_mole_projectile,{speed: bullet_speed, direction: 330, sprite_index: projectile_sprite});
						}
					}
				}
			}
		}else { //retreating back in
			
			if dist_to_travel < dist_to_travel_poke {
				if poke_direction = "up" {
					y += 2;
				}else if poke_direction = "down" {
					y -= 2;
				}else if poke_direction = "left" {
					x -= 2;
				}else if poke_direction = "right" {
					x += 2;
				}
				dist_to_travel += 2;
			}else {
				dist_to_travel = dist_to_travel_poke;
				state_switched = true;
				state = state_waiting;
			}
		}
	}else if delay > 0 { //delay
		delay -= 1;
	}
}

state_fall = function() {
	if sprite_index != spr_mole1_kicking and sprite_index != spr_mole2_kicking and sprite_index != spr_mole3_kicking {
		if object_get_name(object_index) = "obj_boss_mole1" and !is_bomb {
			sprite_index = spr_mole1_falling;
			image_speed = 0;
			image_index = 0;
		}else if object_get_name(object_index) = "obj_boss_mole2" and !is_bomb {
			sprite_index = spr_mole2_falling;
			image_speed = 0;
			image_index = 0;
		}else if object_get_name(object_index) = "obj_boss_mole3" and !is_bomb {
			sprite_index = spr_mole3_falling;
			image_speed = 0;
			image_index = 0;
		}
		if state_switched = true {
			state_switched = false;
			vspd = 0;
			image_xscale = 1; image_yscale = -1; image_angle = 0;
		}
	}
	
	if place_meeting(x,y,pipe1) and y > pipe1.y
	or place_meeting(x,y,pipe2) and y > pipe2.y
	or place_meeting(x,y,pipe3) and y > pipe3.y {
		state_switched = true;
		state = state_waiting;
	}else { //delay
		delay -= 1;
	}
	
	if (place_meeting(x,y,pipe1)
	or place_meeting(x,y,pipe2)
	or place_meeting(x,y,pipe3)) {
		if vspd > 1 {
			vspd -= 1;	
		}else {
			vspd = 1;
		}
		if object_get_name(object_index) = "obj_boss_mole1" and !is_bomb {
			sprite_index = spr_mole1_kicking;
			image_speed = 1;
		}else if object_get_name(object_index) = "obj_boss_mole2" and !is_bomb {
			sprite_index = spr_mole2_kicking;
			image_speed = 1;
		}else if object_get_name(object_index) = "obj_boss_mole3" and !is_bomb {
			sprite_index = spr_mole3_kicking;
			image_speed = 1;
		}
	}else if freeze = false {
		vspd += grav;
	}
		
	y += vspd;
	
}

state_jump = function() {
	if sprite_index != spr_mole1_firing and sprite_index != spr_mole2_firing and sprite_index != spr_mole3_firing {
		if object_get_name(object_index) = "obj_boss_mole1" and !is_bomb {
			sprite_index = spr_mole1_dashing;
			image_speed = 0;
			image_index = 0;
		}else if object_get_name(object_index) = "obj_boss_mole2" and !is_bomb {
			sprite_index = spr_mole2_dashing;
			image_speed = 0;
			image_index = 0;
		}else if object_get_name(object_index) = "obj_boss_mole3" and !is_bomb {
			sprite_index = spr_mole3_dashing;
			image_speed = 0;
			image_index = 0;
		}
	}
	
	if state_switched = true {
		state_switched = false;
		image_xscale = 1; image_yscale = -1; image_angle = 0;
		vspd = jump_spd;
		jump_shot = false;
		if bounced_on = true {
			state = state_waiting;
			state_switched = true;
			bounced_on = false;
		}
	}
	
	if delay <= 0 {
		
	
		if (place_meeting(x,y,pipe1) and y > pipe1.y
		or place_meeting(x,y,pipe2) and y > pipe2.y
		or place_meeting(x,y,pipe3) and y > pipe3.y)
		and vspd > 0 {
			state_switched = true;
			state = state_waiting;
		}
		
		if (place_meeting(x,y,pipe1)
		or place_meeting(x,y,pipe2)
		or place_meeting(x,y,pipe3)) and vspd > 0 {
			if vspd > 1 {
				vspd -= 1;	
			}else {
				vspd = 1;
			}
		}else if freeze = false {
			vspd += grav;
		}
		
		if sprite_index != spr_mole1_firing and sprite_index != spr_mole2_firing and sprite_index != spr_mole3_firing {
			if vspd > -1 and vspd < 0 {
				if object_get_name(object_index) = "obj_boss_mole1" and !is_bomb {
					sprite_index = spr_mole1_firing;
					image_speed = 1;
					image_index = 0;
				}else if object_get_name(object_index) = "obj_boss_mole2" and !is_bomb {
					sprite_index = spr_mole2_firing;
					image_speed = 1;
					image_index = 0;
				}else if object_get_name(object_index) = "obj_boss_mole3" and !is_bomb {
					sprite_index = spr_mole3_firing;
					image_speed = 1;
					image_index = 0;
				}
			}
		}
		
		if (sprite_index = spr_mole1_firing or sprite_index = spr_mole2_firing or sprite_index = spr_mole3_firing) 
		{
			if object_get_name(object_index) = "obj_boss_mole1" and !is_bomb {
				var projectile_sprite = spr_mole1_projectile;
			}else if object_get_name(object_index) = "obj_boss_mole2" and !is_bomb {
				var projectile_sprite = spr_mole2_projectile;
			}else if object_get_name(object_index) = "obj_boss_mole3" and !is_bomb {
				var projectile_sprite = spr_mole3_projectile;
			}else {
				var projectile_sprite = spr_mole1_projectile;
			}
			
			if jump_shot = false and (floor(image_index) = 6 or floor(image_index) = 7) and hp > 0 {
				jump_shot = true;	
				instance_create_depth(x,y-1,depth - 1,obj_boss_mole_projectile,{speed: bullet_speed, sprite_index: projectile_sprite,
				direction: point_direction(x,y-20,obj_player.x+lengthdir_x(22,obj_player.angle+90),obj_player.y+lengthdir_y(22,obj_player.angle+90))});
			}
			
			if scr_Animation_Complete() or floor(image_index) >= 16 {
				if sprite_index = spr_mole1_firing {
					sprite_index = spr_mole1_dashing;
					image_speed = 0;
					image_index = 0;
				}else if sprite_index = spr_mole2_firing {
					sprite_index = spr_mole2_dashing;
					image_speed = 0;
					image_index = 0;
				}else if sprite_index = spr_mole3_firing {
					sprite_index = spr_mole3_dashing;
					image_speed = 0;
					image_index = 0;
				}
			}
		}
		
		y += vspd;
	}else { //delay
		delay -= 1;
	}
}

state_shoot = function() {
	if sprite_index != spr_mole1_kicking and sprite_index != spr_mole2_kicking and sprite_index != spr_mole3_kicking {
		if object_get_name(object_index) = "obj_boss_mole1" and !is_bomb {
			sprite_index = spr_mole1_dashing;
			image_speed = 0;
			image_index = 0;
		}else if object_get_name(object_index) = "obj_boss_mole2" and !is_bomb {
			sprite_index = spr_mole2_dashing;
			image_speed = 0;
			image_index = 0;
		}else if object_get_name(object_index) = "obj_boss_mole3" and !is_bomb {
			sprite_index = spr_mole3_dashing;
			image_speed = 0;
			image_index = 0;
		}
	}
	
	if state_switched = true {
		state_switched = false;
		shoot_spd = 8;
		if bounced_on = true {
			state = state_waiting;
			state_switched = true;
			bounced_on = false;
		}
	}
	
	if delay <= 0 {
		if poke_direction = "up" {
			if (place_meeting(x,y,pipe6) and y < pipe6.y
			or place_meeting(x,y,pipe7) and y < pipe7.y
			or place_meeting(x,y,pipe8) and y < pipe8.y) {
				state_switched = true;
				state = state_waiting;
			}
			
			if (place_meeting(x,y,pipe6)
			or place_meeting(x,y,pipe7)
			or place_meeting(x,y,pipe8)) {
				if object_get_name(object_index) = "obj_boss_mole1" and !is_bomb {
					sprite_index = spr_mole1_kicking;
					image_speed = 1;
				}else if object_get_name(object_index) = "obj_boss_mole2" and !is_bomb {
					sprite_index = spr_mole2_kicking;
					image_speed = 1;
				}else if object_get_name(object_index) = "obj_boss_mole3" and !is_bomb {
					sprite_index = spr_mole3_kicking;
					image_speed = 1;
				}
				if shoot_spd > 1 {
					shoot_spd -= 1;
				}
			}
			
			y -= shoot_spd;
		}else if poke_direction = "down" {
			if (place_meeting(x,y,pipe1) and y > pipe1.y
			or place_meeting(x,y,pipe2) and y > pipe2.y
			or place_meeting(x,y,pipe3) and y > pipe3.y) {
				state_switched = true;
				state = state_waiting;
			}
			
			if (place_meeting(x,y,pipe1)
			or place_meeting(x,y,pipe2) 
			or place_meeting(x,y,pipe3)) {
				if object_get_name(object_index) = "obj_boss_mole1" and !is_bomb {
					sprite_index = spr_mole1_kicking;
					image_speed = 1;
				}else if object_get_name(object_index) = "obj_boss_mole2" and !is_bomb {
					sprite_index = spr_mole2_kicking;
					image_speed = 1;
				}else if object_get_name(object_index) = "obj_boss_mole3" and !is_bomb {
					sprite_index = spr_mole3_kicking;
					image_speed = 1;
				}
				if shoot_spd > 1 {
					shoot_spd -= 1;
				}
			}
			
			y += shoot_spd;
		}else if poke_direction = "left" {
			if (x > pipe4.x
			or  x > pipe5.x) {
				state_switched = true;
				state = state_waiting;
			}
			
			if (place_meeting(x,y,pipe4)
			or place_meeting(x,y,pipe5)) {
				if object_get_name(object_index) = "obj_boss_mole1" and !is_bomb {
					sprite_index = spr_mole1_kicking;
					image_speed = 1;
				}else if object_get_name(object_index) = "obj_boss_mole2" and !is_bomb {
					sprite_index = spr_mole2_kicking;
					image_speed = 1;
				}else if object_get_name(object_index) = "obj_boss_mole3" and !is_bomb {
					sprite_index = spr_mole3_kicking;
					image_speed = 1;
				}
				if shoot_spd > 1 {
					shoot_spd -= 1;
				}
			}
			
			x += shoot_spd;
		}else if poke_direction = "right" {
			if x < pipe9.x
			or x < pipe10.x {
				state_switched = true;
				state = state_waiting;
			}
			
			if (place_meeting(x,y,pipe9)
			or place_meeting(x,y,pipe10)) {
				if object_get_name(object_index) = "obj_boss_mole1" and !is_bomb {
					sprite_index = spr_mole1_kicking;
					image_speed = 1;
				}else if object_get_name(object_index) = "obj_boss_mole2" and !is_bomb {
					sprite_index = spr_mole2_kicking;
					image_speed = 1;
				}else if object_get_name(object_index) = "obj_boss_mole3" and !is_bomb {
					sprite_index = spr_mole3_kicking;
					image_speed = 1;
				}
				if shoot_spd > 1 {
					shoot_spd -= 1;
				}
			}
			
			x -= shoot_spd;
		}
	}else { //delay
		delay -= 1;
	}
}

state = state_waiting;