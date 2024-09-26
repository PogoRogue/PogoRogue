/// @description Insert description here
// You can write your code in this editor

air = instance_create_depth(x+lengthdir_x(8,image_angle),y+lengthdir_y(8,image_angle),depth,obj_env_air_effect);
air2 = instance_create_depth(x+lengthdir_x(8,image_angle)+lengthdir_x(32,image_angle-90),y+lengthdir_y(8,image_angle)+lengthdir_y(32,image_angle-90),depth,obj_env_air_effect);
air.image_angle = self.image_angle;
air2.image_angle = self.image_angle;


//snap to wall
if image_angle % 360 != 90 and image_angle % 360 != 270 {
	if !place_meeting(x+1,y,obj_ground) and !place_meeting(x-1,y,obj_ground) { //not currently attatched to wall
		if place_meeting(x+17,y,obj_ground) and !place_meeting(x-17,y,obj_ground) {
			x += 16;
		}
		if !place_meeting(x+17,y,obj_ground) and place_meeting(x-17,y,obj_ground) {
			x -= 16;
		}
	}
}

scr_Create_Collision_Walls();