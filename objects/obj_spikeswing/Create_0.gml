///create event
angle_accelerration = 0;
angle_velocity = 0;
angle = 0;
anchor_x = x;
anchor_y = y - distance;
damage = 8;

image_index = 1;

// Set up initial position
var new_x = anchor_x + lengthdir_x(distance, angle);
var new_y = anchor_y + lengthdir_y(distance, angle);

hsp = new_x - x;
vsp = new_y - y;

x += hsp;
y += vsp;

image_angle = angle + 90;
