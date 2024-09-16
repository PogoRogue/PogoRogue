//flames particle outline
with obj_flames_particle {
	other.depth = depth+2;
	draw_sprite(spr_dash_flames2_particle_outline,image_index,x,y);	
}

with obj_jetpack_smoke {
	other.depth = depth+2;
	draw_sprite(spr_jetpack_smoke_outline,image_index,x,y);	
}

with obj_cage {
	if image_alpha = 1 {
		other.depth = depth+200;
		draw_sprite(spr_cage_back,0,x,y);	
	}
}

with obj_enemy_snail_slime {
	other.depth = depth + 1;
	draw_sprite_ext(spr_enemy_snail_slime_outline,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);	
}


with obj_enemy_snail_slime_red {
	other.depth = depth + 1;
	draw_sprite_ext(spr_enemy_snail_slime_outline,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);	
}