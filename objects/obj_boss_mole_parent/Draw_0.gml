if(red_frames > 0 and shaded = false) {
	shader_set(sh_tint_red);
	shaded = true;
}

if(!is_dead) and !is_bomb {
	image_alpha = abs(cos(current_iframes / 5)) + 0.2;
}

if !(is_bomb and instance_exists(obj_explosion)) {
	draw_self();
}
if shaded = true {
	shader_reset();	
	shaded = false;
}


if(draw_hp && hp < hp_max && hp > 0) {
	scr_Draw_Enemy_Health();
}

hp_percent = (hp / hp_max) * 100;
