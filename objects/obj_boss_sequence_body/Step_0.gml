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

if spawned = true {
	if white_alpha > 0 {
		white_alpha -= 0.05;
	}
}else {
	if white_alpha < 1 {
		white_alpha += 0.05;
	}else {
		spawned = true;
	}
}

if hp <= 0 {
	explode = true;
}
	
if explode = true {
	image_alpha = 1;
	if red_alpha < 1.25 {
		red_alpha += 0.025;
	}else {
		instance_destroy();
	}
}