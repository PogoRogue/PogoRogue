/// @description Handle movement
// Inherit the parent event
event_inherited();
image_alpha = 1.0;

hp_percent = (hp / hp_max) * 100;
is_hurt = previous_hp != hp;

if(is_dead || (ability != BOSS3_ABILITIES.SHIELD && (alarm[2] < room_speed * 0.5 || alarm[2] > ability_cooldown - (room_speed * 0.5)))) {
	image_angle = lerp(image_angle, 0, 0.1);
} else {
	angle_accelerration = swingspeed * dcos(angle);
	angle_velocity += angle_accelerration;
	angle += angle_velocity;
	image_angle = lerp(image_angle, angle + 90, 0.1);
}

hsp = anchor_x + lengthdir_x(distance, angle) - x;
vsp = anchor_y + lengthdir_y(distance, angle) - y;

if(is_hurt && spring_force == 0) {
	spring_force = 25;
	oscillation = 0;
}

vsp += spring_force * sin(oscillation);
spring_force *= damping;
oscillation += 0.08;

x += hsp;
y += vsp;

previous_hp = hp;

if(is_dead) {
	limb_alpha *= 0.9;
	with(obj_boss_marionette_arm) {
		image_alpha = other.limb_alpha;
	}
	with(obj_boss_marionette_forearm) {
		image_alpha = other.limb_alpha;
	}
	with(obj_boss_marionette_leg) {
		image_alpha = other.limb_alpha;
	}
	with(obj_boss_marionette_thigh) {
		image_alpha = other.limb_alpha;
	}
}

if(is_dead) {
	weapon = BOSS3_WEAPONS.NONE;
	ability = BOSS3_ABILITIES.NONE;
}
