/// @description Draw self

if spawned = true {

	if(is_dead) {
		shader_set(sh_tint_red);
	}

	draw_self();

	shader_reset();

	if sprite_index = spr_B1_Shield_Attached {
		draw_sprite_ext(spr_B1_Shield_Attached_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,red_alpha);
	}else if sprite_index = spr_B1_Fly_Attached {
		draw_sprite_ext(spr_B1_Fly_Attached_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,red_alpha);
	}if sprite_index = spr_B1_Explode_Attached {
		draw_sprite_ext(spr_B1_Explode_Attached_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,red_alpha);
	}if sprite_index = B1_Tar_Attached {
		draw_sprite_ext(B1_Tar_Attached_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,red_alpha);
	}

}

if sprite_index = spr_B1_Shield_Attached {
	draw_sprite_ext(spr_B1_Shield_Attached_white,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,white_alpha);
}else if sprite_index = spr_B1_Fly_Attached {
	draw_sprite_ext(spr_B1_Fly_Attached_white,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,white_alpha);
}if sprite_index = spr_B1_Explode_Attached {
	draw_sprite_ext(spr_B1_Explode_Attached_white,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,white_alpha);
}if sprite_index = B1_Tar_Attached {
	draw_sprite_ext(B1_Tar_Attached_white,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,white_alpha);
}