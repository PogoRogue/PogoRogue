/// @description Floor On

power_on = true;
//sprite_index = spr_electric_current_on;
alarm[0] = room_speed * on_time;

if scr_In_Camera_View(128) {
	laser_obj = instance_create_depth(x+8*image_xscale,y+6*image_xscale,depth-1,obj_laser_hazard,{parent_index: self, image_xscale: image_xscale});
}