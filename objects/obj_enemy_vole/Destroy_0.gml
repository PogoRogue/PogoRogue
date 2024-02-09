/// @description Check if enemy was killed or just timed out

// Inherit the parent event
if(parent.vole_is_dead) {
	parent.vole_is_dead = true;
	event_inherited();
} else {
	parent.vole_hp = hp;
}

