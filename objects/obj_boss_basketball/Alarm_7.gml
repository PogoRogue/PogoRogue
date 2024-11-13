if freeze = true {
	alarm[7] = 1;
	exit;
}

image_index = 0;
if hp > 0 {
	instance_create_depth(x+lengthdir_x(4,rot_angle)+lengthdir_x(6,rot_angle-90),y+lengthdir_y(4,rot_angle)+lengthdir_y(6,rot_angle-90),-40,obj_boss_tennis_projectile,{speed: 4, 
	direction: point_direction(x,y,obj_player.x+lengthdir_x(22,obj_player.angle+90),obj_player.y+lengthdir_y(22,obj_player.angle+90))});
	scr_Screen_Shake(3.5,8,false);
}
slow_down = true;

alarm[8] = 15;