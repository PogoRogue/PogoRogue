/// @description Handle movement
// Inherit the parent event
event_inherited();

hp_percent = (hp / hp_max) * 100;
is_hurt = previous_hp != hp;

angle_accelerration = swingspeed * dcos(angle);
angle_velocity += angle_accelerration;
angle += angle_velocity;

hsp = anchor_x + lengthdir_x(distance, angle) - x;
vsp = anchor_y + lengthdir_y(distance, angle) - y;

if(is_hurt) {
	spring_force = 25;
	oscillation = 0;
}

vsp += spring_force * sin(oscillation);
spring_force *= damping;
oscillation += 0.08;

x += hsp;
y += vsp;


/*
//Code for abilities here
//Ground Pound
if(special_action=="ground_pound"){
//stop when hitting the ground and create shock wave
    if(place_meeting(x,y+vspeed,obj_ground_parent)){
        vspeed=0;
        special_action="return";
		if(phase=2){
          var _shock1 = instance_create_layer(x, y, "Instances", obj_shockwave);
          var _shock2 = instance_create_layer(x, y, "Instances", obj_shockwave);
          _shock2.image_xscale=-1;
          _shock1.hspeed=-3;
          _shock2.hspeed=3;
		}
    }
}

//after taking certain action, return to OG position
if(special_action=="return") {
	direction=point_direction(x,y,orig_x,orig_y);
	speed=5;
	if(distance_to_point(orig_x,orig_y)<=5){
		x=orig_x;
		y=orig_y;
	}
	if(x==orig_x and y==orig_y){
		speed=0;
		special_action="NO";
	}
}
*/

image_angle = angle + 90;
previous_hp = hp;
