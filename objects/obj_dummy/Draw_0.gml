if(red_frames > 0 and shaded = false) {
	shader_set(sh_tint_red);
	shaded = true;
}

/*if(!is_dead) {
	image_alpha = abs(cos(current_iframes / 5)) + 0.2;
}*/

draw_self();
if shaded = true {
	shader_reset();	
	shaded = false;
}
draw_sprite(sprite_index,2,x,y);