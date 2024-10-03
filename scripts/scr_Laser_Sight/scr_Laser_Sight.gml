// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Laser_Sight(){
	//draw laser sight
	var laser_length = 0;
	var laser_length = 0;
	if global.drilltipbullets = false {
		while collision_line(x-1,y-1,x-1+lengthdir_x(laser_length,angle-90),y-1+lengthdir_y(laser_length,angle-90),obj_ground,false,true) = noone
		and collision_line(x-1,y-1,x-1+lengthdir_x(laser_length,angle-90),y-1+lengthdir_y(laser_length,angle-90),obj_ground_oneway,true,true) = noone
		and collision_line(x-1,y-1,x-1+lengthdir_x(laser_length,angle-90),y-1+lengthdir_y(laser_length,angle-90),obj_enemy_parent,true,true) = noone {
			laser_length += 1;
			if laser_length > 1000 {
				break;	
			}
		}
	}else {
		laser_length = 1000;
	}
	draw_set_alpha(0.6);
	if laser_sight = true and obj_player.state != obj_player.state_portal and obj_player.state != obj_player.state_shop_portal 
	and obj_player.state != obj_player.state_immobile  {
		draw_line_width_color(x-1,y-1,x-1+lengthdir_x(laser_length,angle-90),y-1+lengthdir_y(laser_length,angle-90),1.25,make_color_rgb(180,82,82),make_color_rgb(180,82,82));
	}
	draw_set_alpha(1);
}