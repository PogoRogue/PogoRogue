/// @description initialize variables
image_index = 0;
damage = 4;
with instance_create_depth(x,y,depth-1,obj_projectile_flash_effect) {
	image_index = other.flash_frame;
}

if destroy_time != 0 {
	alarm[0] = destroy_time;
}