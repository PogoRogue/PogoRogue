/// @description Draw self

if spawned = true {
	if(controller.current_state == BOSS2_STATES.VULNERABLE) {
		if(red_frames > 0) {
			shader_set(sh_tint_red);
		}
	}

	draw_self();
	shader_reset();
}

draw_sprite_ext(spr_sequence_idle_white,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,white_alpha);
draw_sprite_ext(spr_sequence_idle_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,red_alpha);