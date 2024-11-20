/// @description Draw turret body

// Inherit the parent event
event_inherited();

if(snowball_freeze = true and shaded = false and !is_dead) {
	shader_set(sh_tint_blue);
	shaded = true;
}

if(red_frames > 0 and shaded = false) {
	shader_set(sh_tint_red);
	shaded = true;
}

draw_sprite_ext(body_sprite, 0, x, y, 1, 1, rotation, -1, image_alpha);


if shaded = true {
	shader_reset();	
	shaded = false;
}