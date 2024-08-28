// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Create_Flames(){
	var new_angle = obj_player.angle;
	if obj_player.image_xscale = 1 {
		repeat(3) {
			var side = choose(0,180);
			var y_offset = 5 + random_range(0,3);
			var rand_range = irandom_range(0,11);
			instance_create_depth(x+(lengthdir_x(rand_range,new_angle+side)+lengthdir_x(3+y_offset,new_angle-90)),(y+lengthdir_y(rand_range,new_angle+side)+lengthdir_y(3+y_offset,new_angle-90)),depth-1,obj_flames_particle);
		}
		var y_offset = 5 + random_range(0,3);
		instance_create_depth(x+(lengthdir_x(12,new_angle)+lengthdir_x(3+y_offset,new_angle-90)),(y+lengthdir_y(12,new_angle)+lengthdir_y(3+y_offset,new_angle-90)),depth-1,obj_flames_particle);
		//instance_create_depth(x+(lengthdir_x(3+y_offset,new_angle-90)),(y+lengthdir_y(3+y_offset,new_angle-90)),depth-1,obj_flames_particle);
		instance_create_depth(x+(lengthdir_x(14,new_angle+180)+lengthdir_x(3+y_offset,new_angle-90)),(y+lengthdir_y(14,new_angle+180)+lengthdir_y(3+y_offset,new_angle-90)),depth-1,obj_flames_particle);
	}else if obj_player.image_xscale = -1 {
		repeat(3) {
			var side = choose(0,180);
			var y_offset = 5 + random_range(0,3);
			var rand_range = irandom_range(0,11);
			if obj_player.angle != 0 {
				instance_create_depth(x+(lengthdir_x(rand_range,new_angle+side)+lengthdir_x(3+y_offset,new_angle-90)),(y+lengthdir_y(rand_range,new_angle+side)+lengthdir_y(3+y_offset,new_angle-90)),depth-1,obj_flames_particle);
			}else {
				instance_create_depth(x+(lengthdir_x(rand_range,new_angle+side)+lengthdir_y(3+y_offset,new_angle-90))-6,(y+lengthdir_y(rand_range,new_angle+side)+lengthdir_y(3+y_offset,new_angle-90)),depth-1,obj_flames_particle);
			}
		}
		var y_offset = 5 + random_range(0,3);
		instance_create_depth(x+(lengthdir_x(14,new_angle)+lengthdir_x(3+y_offset,new_angle-90)),(y+lengthdir_y(14,new_angle)+lengthdir_y(3+y_offset,new_angle-90)),depth-1,obj_flames_particle);
		//instance_create_depth(x+(lengthdir_x(3+y_offset,new_angle-90)),(y+lengthdir_y(3+y_offset,new_angle-90)),depth-1,obj_flames_particle);
		instance_create_depth(x+(lengthdir_x(12,new_angle+180)+lengthdir_x(3+y_offset,new_angle-90)),(y+lengthdir_y(12,new_angle+180)+lengthdir_y(3+y_offset,new_angle-90)),depth-1,obj_flames_particle);
	}
}