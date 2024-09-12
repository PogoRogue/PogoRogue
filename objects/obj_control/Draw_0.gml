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