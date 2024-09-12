/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if rotation_dir = 1 and image_angle = 0 {
	image_xscale = 1;
}else if image_angle = 0 {
	image_xscale = -1;
}

if rotating = true {
	if image_angle > -90 and image_angle < 90 and !(dir_changed = true and image_angle = 0) {
		if !place_meeting(x,y,obj_player) and !is_dead {
			image_angle += 5 * -rotation_dir;
		}
	}else  {
		image_angle = 0;
		if dir_changed = false {
			image_index += 1 * rotation_dir;
			angle += 90 * rotation_dir;
			x += 40 * rotation_dir;
		}else {
			x += 40 * rotation_dir;
			if sprite_index = normal_sprite {
				sprite_index = flipped_sprite;
			}else if sprite_index = flipped_sprite {
				sprite_index = normal_sprite;
			}
		}
		dir_changed = false;
		rotating = false;
		alarm[1] = 45;
		laser_obj = instance_create_depth(x,y-20,depth-1,obj_cubeenemy_laser,{parent_index: self});
		if double = true {
			laser_obj2 = instance_create_depth(x,y-20,depth-1,obj_cubeenemy_laser2,{parent_index: self});
		}
	}
	
	//colliding with ground mid turn
	if place_meeting(x+(4*rotation_dir),y-12,obj_ground) {
		rotation_dir *= -1;
		dir_changed = true;
	}
	
	//no ground below
	if !position_meeting(bbox_left-2,bbox_bottom+2,obj_ground) and !position_meeting(bbox_left-2,bbox_bottom+2,obj_ground_oneway) and image_angle = 0 
	or !position_meeting(bbox_right+2,bbox_bottom+2,obj_ground) and !position_meeting(bbox_right+2,bbox_bottom+2,obj_ground_oneway) and image_angle = 0 {
		rotation_dir *= -1;
		
		x += 40 * rotation_dir;
		if sprite_index = normal_sprite {
			sprite_index = flipped_sprite;
		}else if sprite_index = flipped_sprite {
			sprite_index = normal_sprite;
		}
		if rotation_dir = 1 and image_angle = 0 {
			image_xscale = 1;
		}else if image_angle = 0 {
			image_xscale = -1;
		}
		
		//laser_obj = instance_create_depth(x,y-20,depth-1,obj_cubeenemy_laser,{parent_index: self});
		
		var mid_x = bbox_left + ((bbox_right-bbox_left)/2);
		if !position_meeting(mid_x,bbox_bottom+2,obj_ground) and !position_meeting(mid_x,bbox_bottom+2,obj_ground_oneway) and image_angle = 0 {
			rotating = true;
			with laser_obj {
				instance_destroy()	
			}
			with laser_obj2 {
				instance_destroy()	
			}
		}
	}
}

if !place_meeting(x,y+1,obj_ground) and !place_meeting(x,y+1,obj_ground_oneway) and !is_dead {
	vspd += grav;
}

if place_meeting(x,y+vspd,obj_ground) {
	while !place_meeting(x,y+sign(vspd),obj_ground) {
		y += sign(vspd);
	}
	vspd = 0;
}

if place_meeting(x,y+vspd,obj_ground_oneway) {
	while !place_meeting(x,y+sign(vspd),obj_ground_oneway) {
		y += sign(vspd);
	}
	vspd = 0;
}

y += vspd;