spawned = false;
free = true;
outside_gates = false;
gate_object = noone;
move_speed = 4;
arrows_alpha = 2;
moved = false;
time_left = 309;
time_end = false;
init_xscale = 1 * sign(obj_player.image_xscale);
init_yscale = 1;
init_x = x;
init_y = y;
x_diff = obj_player.x-x;
y_diff = obj_player.y-y;
shots_left = 3;

draw_respawn = false;
new_xscale = 0;
new_yscale = 0;

angle =  0;
button_num = 2;

init_x = obj_player.x;
init_y = obj_player.y;	
flash = false;

alarm[1] = 1;
