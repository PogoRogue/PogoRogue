/// @description Move player
if instance_exists(obj_player) {
	if place_meeting(x,y-2,obj_player) and obj_player.state = obj_player.state_bouncing 
	or place_meeting(x,y-2,obj_player) and obj_player.state = obj_player.state_chargejump {
		if move_right = true {
			obj_player.x += spd;
			obj_player.hspeed = spd;
		}else {
			obj_player.x -= spd;
			obj_player.hspeed = -spd;
		}
	}
}