//starting position
if global.player_spawn_x != 0 and global.player_spawn_y != 0 {
	x = global.player_spawn_x;
	y = global.player_spawn_y;
	global.player_spawn_x = 0;
	global.player_spawn_y = 0;
	obj_camera.x = x;
	obj_camera.y = y-32;
}
hspeed = 0;
vspeed = 0;
image_xscale = 1;
angle = 0;
	
state = state_free;

alarm[2] = 10;