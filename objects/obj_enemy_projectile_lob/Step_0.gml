/// @description Update position

y_spd -= grav;
y -= y_spd;

if(y > initial_y) {
	instance_destroy(self);	
}

if place_meeting(x,y,obj_enemy_shooter) and y_spd < 0 {
	instance_destroy(self);	
}