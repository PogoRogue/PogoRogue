/// @description Draw marionette string

draw_line_width_color(anchor_x, anchor_y, x, y, 1, #4b80ca, #4b80ca);

// Inherit the parent event
event_inherited();

switch(ability) {
	case BOSS3_ABILITIES.GROUND_POUND:
		draw_sprite_ext(spr_pickup_groundpound, 0, x + lengthdir_x(28, image_angle - 78), y + lengthdir_y(28, image_angle - 78), 1, 1, image_angle, c_white, image_alpha);
		break;
	case BOSS3_ABILITIES.SHIELD:
		draw_sprite_ext(spr_pickup_shieldbubble, 0, x + lengthdir_x(28, image_angle - 78), y + lengthdir_y(28, image_angle - 78), 1, 1, image_angle, c_white, image_alpha);
		break;
	case BOSS3_ABILITIES.BULLET_BLAST:
		draw_sprite_ext(spr_pickup_bulletblast, 0, x + lengthdir_x(28, image_angle - 78), y + lengthdir_y(28, image_angle - 78), 1, 1, image_angle, c_white, image_alpha);
		break;
}

draw_sprite_ext(spr_boss_marionette_glass_cover, 0, x + lengthdir_x(28, image_angle - 78), y + lengthdir_y(28, image_angle - 78), 1, 1, image_angle, c_white, image_alpha);
