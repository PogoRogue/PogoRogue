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

image_angle = angle + 90;

previous_hp = hp;
