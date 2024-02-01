/// @description Move player
if instance_exists(obj_player) {
	if place_meeting(x,y-2,obj_player) and obj_player.state = obj_player.state_bouncing 
	or place_meeting(x,y-2,obj_player) and obj_player.state = obj_player.state_chargejump 
	or obj_player.platform_index = self and obj_player.state = obj_player.state_chargejump {
		if move_right = true {
			obj_player.platform_speed = spd;
			obj_player.x += obj_player.platform_speed;
			obj_player.platform_index = self;
		}else {
			obj_player.platform_speed = -spd;
			obj_player.x += obj_player.platform_speed;
			obj_player.platform_index = self;
		}
	}else if obj_player.platform_index = self {
		obj_player.hspeed += obj_player.platform_speed;
		obj_player.platform_index = noone;
	}
}