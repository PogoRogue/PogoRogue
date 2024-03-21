/// @description Instantiate variables

// Inherit the parent event
event_inherited();

if(!instance_exists(obj_slime_outline)) {
	instance_create_layer(0, 0, "enemies", obj_slime_outline);
}

enum SNAIL_STATES {
	HORIZONTAL,
	VERTICAL_LEFT,
	VERTICAL_RIGHT,
}

var ex, ey;
ex = instance_nearest(x, y, obj_ground_parent).x;
ey = instance_nearest(x, y, obj_ground_parent).y;
if (point_distance(x, y, ex, ey) < 100)
{
     show_debug_message("ground object in range");
}

//with obj_ground_parent {
//    if point_distance(x, y, point_x, point_y) <= 100 {
//        show_debug_message("ground object in range");
//    }
//

state = SNAIL_STATES.HORIZONTAL;
alarm[3] = 1;

// Instantiate additional variables
depth = 5;
spd = 0.5;
at_edge = false;
at_wall = false;
