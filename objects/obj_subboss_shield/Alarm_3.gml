/// @description Floor On

power_on = true;
//sprite_index = spr_electric_current_on;
alarm[2] = round(room_speed * on_time);

laser_obj = instance_create_depth(x,y,depth-1,obj_laser_boss);