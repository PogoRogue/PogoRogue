/// @description Player collision
if (place_meeting(x,y,obj_player) or place_meeting(x,y,obj_player_mask)) {
	
	if obj_player.state != obj_player.state_portal {
		obj_player.portal_object = self;
		obj_player.portal_speed = obj_player.speed/2;
		obj_player.portal_angle_speed = 0;
		obj_player.portal_rot_distance = 0;
		obj_player.state = obj_player.state_portal;
	}
}