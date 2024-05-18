/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_enemy_projectile_slime_outline, image_index, x - 1, y - 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
draw_sprite_ext(spr_enemy_projectile_slime_outline, image_index, x - 1, y + 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
draw_sprite_ext(spr_enemy_projectile_slime_outline, image_index, x + 1, y - 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);
draw_sprite_ext(spr_enemy_projectile_slime_outline, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, #4E584A, image_alpha);

draw_self();