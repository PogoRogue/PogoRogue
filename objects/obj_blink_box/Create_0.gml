spawned = false;
free = true;
move_speed = 4;
arrows_alpha = 2;
moved = false;
time_left = 189;
time_end = false;
init_xscale = 1 * sign(obj_player.image_xscale);
init_yscale = 1;
init_x = x;
init_y = y;
x_diff = obj_player.x-x;
y_diff = obj_player.y-y;

draw_respawn = false;
new_xscale = 0;
new_yscale = 0;