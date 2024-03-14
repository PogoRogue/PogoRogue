/// @description 

with (obj_enemy_snail_slime) {
    draw_sprite_ext(sprite_index, image_index, x - 1, y - 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
    draw_sprite_ext(sprite_index, image_index, x - 1, y + 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
    draw_sprite_ext(sprite_index, image_index, x + 1, y - 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
}

with (obj_enemy_projectile_slime) {
    draw_sprite_ext(sprite_index, image_index, x - 1, y - 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
    draw_sprite_ext(sprite_index, image_index, x - 1, y + 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
    draw_sprite_ext(sprite_index, image_index, x + 1, y - 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
}

with (obj_boss_sequence_melee) {
	if(!is_dead) {
	    draw_sprite_ext(sprite_index, image_index, x - 1, y - 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
	    draw_sprite_ext(sprite_index, image_index, x - 1, y + 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
	    draw_sprite_ext(sprite_index, image_index, x + 1, y - 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
	    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
	}
}

with (obj_boss_sequence_melee_arm) {
	if(!is_dead) {
	    draw_sprite_ext(sprite_index, image_index, x - 1, y - 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
	    draw_sprite_ext(sprite_index, image_index, x - 1, y + 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
	    draw_sprite_ext(sprite_index, image_index, x + 1, y - 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
	    draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
	}
}
