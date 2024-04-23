/// @description Draw self

draw_self();

if(!boss.is_dead) {
	draw_line_width_color(boss.anchor_x, boss.anchor_y, x + lengthdir_x(32, image_angle - 90), y + lengthdir_y(32, image_angle - 90), 1, wire_color, wire_color);
}

draw_sprite_ext(spr_boss_marionette_foot, 0, x + lengthdir_x(32, image_angle - 90), y + lengthdir_y(32, image_angle - 90), 1, 1, image_angle - 10, c_white, image_alpha);
