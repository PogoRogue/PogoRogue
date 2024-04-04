/// @description Away from player when they enter the range

// Inherit the parent event
event_inherited();

distance = point_distance(x, y, obj_player.x, obj_player.y);

//show_message(d);
if(distance < range && is_moving == false) {
	follow_path = path_add();
    alarm[1] = 1;
}

if(x == target_x && y == target_y) {
	alarm[0] = 1;
}
