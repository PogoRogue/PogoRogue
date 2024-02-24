/// @description Handle state relevant changes

// Inherit the parent event
event_inherited();

if(controller.current_state != STATES.VULNERABLE) {
	sprite_index = spr_boss2_immune
	stomp_defense = 0.0;
	bullet_defense = 0.0;
} else {
	sprite_index = spr_boss2_vulnerable
	stomp_defense = 1.0;
	bullet_defense = 1.0;
}