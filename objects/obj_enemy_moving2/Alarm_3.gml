/// @description Insert description here
// You can write your code in this editor
if !is_dead { 
	if red_frames = 0 {
		instance_create_depth(x-(3*image_xscale),y-21,depth+1,obj_robot_laser,{h_spd: image_xscale * 16,image_xscale: image_xscale,parent: self});
		//instance_create_depth(x-(2*image_xscale),y-20,depth-1,obj_robot_laser,{h_spd: image_xscale * 16,image_xscale: image_xscale,parent: self});
	
	}
	draw_laser = false;

	//firing_cooldown = false;
	image_index = 0;
	image_speed = 1;
	sprite_index = spr_walk_enemy_walk_1;
	current_state = ROBOT_STATES.WALKING;
}