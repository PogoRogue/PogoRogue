
x += hspd;
y += vspd;

//cant damage enemies if out of view
if instance_exists(obj_camera) {
	var camera_width = camera_get_view_width(view_camera[0])/2;
	var camera_height = camera_get_view_height(view_camera[0])/2;
	var padding = 256;

	damage = init_damage;
	
	//destroy if far enough away from camera
	if  !(point_in_rectangle(x,y,obj_camera.x-camera_width-(padding*10),obj_camera.y-camera_height-(padding*10),obj_camera.x+camera_width+(padding*10),obj_camera.y+camera_height+(padding*10))) {
		instance_destroy();
	}
}

//missile

//speed up
if speed < 12 {
	speed += 12;	
}
	
//rotate
if target_obj != noone {
	//num_of_bounces = 0;
	damage = init_damage;
	scr_Gradually_Turn(self.id,target_obj,60,1);
	direction = image_angle;
	if place_meeting(x,y,target_obj) {
		instance_destroy();	
	}
}else {
	direction = image_angle;
		
	if place_meeting(x,y+vspeed,obj_ground_oneway) and !place_meeting(x,y,obj_ground_oneway) and vspeed > 0 {
		instance_destroy();	
	}
}


if destroyable = false and !place_meeting(x,y,obj_ground) {
	destroyable = true;	
}
mask_index = sprite_index;