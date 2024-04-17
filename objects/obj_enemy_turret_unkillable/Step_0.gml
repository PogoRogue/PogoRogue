/// @description Insert description here
// You can write your code in this editor

if(hp <= 0 && is_active) {
	is_active = false;
	alarm_set(2, room_speed * 7); // Initiate reactivation timer
}

if(is_active) {
	// Inherit the parent event
	event_inherited();
	alarm_set(2, 0);
	body_sprite = spr_slime_turret_body;
} else {
	var _dest = image_angle < 90 ? -90 : 270;
	image_angle = lerp(image_angle, _dest, 0.05);
	sprite_index = spr_slime_turret_head_inactive;
	weapon_cooldown = cooldown_length;
	body_sprite = spr_slime_turret_body_inactive;
}

damage = is_active ? 8 : 0;

if(hp <= 0) {
	hp = hp_max; // Don't allow death
}
red_frames = 0;
current_iframes = 0;
