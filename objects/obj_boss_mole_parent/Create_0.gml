// Inherit the parent event
event_inherited();
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
depth = 501;

hp = 96;
hp_max = hp;
draw_hp = false;
stomp_defense = 2;

// Healthbar dimensions
view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
top_border = view_height - 20;
hp_percent = (hp / hp_max) * 100;

state_waiting = function() {
	if state_switched = true {
		state_switched = false;
	}
}

state_poke = function() {
	if state_switched = true {
		state_switched = false;
		dist_to_travel = dist_to_travel_poke;
		reached_end = false;
		pause_time = pause_time_poke;
	}
	
	if delay <= 0 {
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
				}else {
					reached_end = true;
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
	}else { //delay
		delay -= 1;
	}
}

state_fall = function() {
	if state_switched = true {
		state_switched = false;
		image_xscale = 1; image_yscale = -1; image_angle = 0;
	}
	
}

state_jump = function() {
	if state_switched = true {
		state_switched = false;
		image_xscale = 1; image_yscale = -1; image_angle = 0;
	}
}

state_shoot = function() {
	if state_switched = true {
		state_switched = false;
	}
}

state = state_waiting;