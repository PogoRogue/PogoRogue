// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Button_Collision_Check(){
	/*
	if(place_meeting(x+hspeed,y,obj_button)) {
		while !(place_meeting(x+sign(hspeed),y,obj_button)) {
			x += sign(hspeed);
		}	
		
		with instance_place(x + sign(hspeed),y,obj_button) {
			// other is the player
			if other.state != other.state_chargejump {
				other.state = other.state_bouncing;
			}
		
			if other.vsp_basicjump < -7 { //check if state = state_groundpound
				other.pickup_groundpound.cooldown_time = 0;
			}
		
			is_pressed = true;
		}
		
		other.hspeed = 0;
	}
	
	if(place_meeting(x, y + vspeed, obj_button)) {
		while !(place_meeting(x, y + sign(vspeed), obj_button)) {
			y += sign(vspeed);
		}
		
		with instance_place(x, y + sign(vspeed), obj_button) {
			// other is the player
			if other.state != other.state_chargejump {
				other.state = other.state_bouncing;
			}
		
			if other.vsp_basicjump < -7 { //check if state = state_groundpound
				other.pickup_groundpound.cooldown_time = 0;
			}
		
			is_pressed = true;
		}
		
		other.vspeed = 0;
	}
	*/
}