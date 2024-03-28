// Inherit the parent event
 
event_inherited();

if(!instance_exists(obj_setup_pathway)) {
	instance_create_layer(0, 0, "enemies", obj_setup_pathway);
}

x_spd = 1;
y_spd = 1;
spd = 2;

hp = 16;
hp_max = hp;
hp_percent = (hp / hp_max) * 100;
is_moving = false
found = false;
reached_target = false;
range = 200;
distance = point_distance(x,y,obj_player.x,obj_player.y);
target_x = 0;
target_y = 0;

image_xscale = x_spd;
if(obj_player.x >= x) {
	image_xscale = -1;
} else if(obj_player.x <= x) {
	image_xscale = 1;
}
