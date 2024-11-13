if(red_frames > 0 and shaded = false) {
	shader_set(sh_tint_red);
	shaded = true;
}

if(!is_dead) {
	image_alpha = abs(cos(current_iframes / 5)) + 0.2;
}

draw_sprite_ext(sprite_index,image_index,x,y,1,1,rot_angle,c_white,image_alpha);

if red_frames > 0 {
	if size = 4 {
		var new_image_index = 1;
		draw_sprite_ext(spr_boss_basketball,new_image_index,x,y,1,1,rot_angle,c_white,image_alpha);
	}else if size = 3 {
		var new_image_index = 1;
		draw_sprite_ext(spr_boss_soccerball,new_image_index,x,y,1,1,rot_angle,c_white,image_alpha);
	}else if size = 2 {
		var new_image_index = 1;
		draw_sprite_ext(spr_boss_volleyball,new_image_index,x,y,1,1,rot_angle,c_white,image_alpha);
	}else if size = 1 {
		var new_image_index = 1;
		draw_sprite_ext(spr_boss_tennisball,2,x,y,1,1,rot_angle,c_white,image_alpha);
	}
	
}

if shaded = true {
	shader_reset();	
	shaded = false;
}


if(draw_hp && hp < hp_max && hp > 0) {
	scr_Draw_Enemy_Health();
}

hp_percent = (hp / hp_max) * 100;
