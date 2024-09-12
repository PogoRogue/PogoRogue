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

//create portal
if room != room_proc_gen_test and room != room_shop and global.last_room != room_shop
or room != room_shop and global.last_room != room_shop {
	instance_create_depth(x,y+3,depth+10,obj_portal);
	state = state_spawn;
	image_xscale = 0;
	image_yscale = 0;
}

if room = room_shop or global.last_room = room_shop {
	state = state_shop;
	image_xscale = 1;
	image_yscale = 1;
	hspeed = 0;
	vspeed = 0;
}

table = false;

for (i = 0; i < array_length(bouncing_array); i++) {
	if player_sprite = bouncing_array[i] {
		global.current_skin = i;	
	}
}