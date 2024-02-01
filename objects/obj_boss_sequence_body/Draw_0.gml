/// @description Draw self

if(controller.current_state == STATES.VULNERABLE) {
	if(red_frames > 0) {
		shader_set(sh_tint_red);
	}
}

draw_self();
shader_reset();