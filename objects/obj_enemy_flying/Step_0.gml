/// @description Fly back and forth

// Inherit the parent event
event_inherited();

if(is_dead) {
	spd = 0;	
} else if (place_meeting(x + speed, y, obj_ground)) {
	spd *= -1;
	image_xscale = sign(spd);
}

x += spd;

if(!place_meeting(x + speed, y + sin(y_spd), obj_ground)) {
	y += sin(y_spd);
}

y_spd += 0.05;

if place_meeting(x,y,obj_ground_oneway) {
	depth = -1; //instance_place(x,y,obj_ground_oneway).depth-10;	
}
if place_meeting(x,y,obj_chest) {
	depth = instance_place(x,y,obj_chest).depth-10;	
}