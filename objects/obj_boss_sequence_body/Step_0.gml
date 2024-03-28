/// @description Handle state relevant changes

// Inherit the parent event
event_inherited();

hp_percent = (hp / hp_max) * 100;

if(controller.current_state != BOSS2_STATES.VULNERABLE) {
	stomp_defense = 0.0;
	bullet_defense = 0.0;
} else {
	stomp_defense = 1.0;
	bullet_defense = 1.0;
}