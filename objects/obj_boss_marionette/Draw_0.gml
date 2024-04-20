/// @description Draw marionette string

draw_line_width_color(anchor_x, anchor_y, x, y, 1, #4b80ca, #4b80ca);


// Inherit the parent event
event_inherited();

switch(ability) {
	case BOSS3_ABILITIES.NONE:
		break;
	case BOSS3_ABILITIES.GROUND_POUND:
		draw_sprite_ext(spr_pickup_groundpound, 0, x + lengthdir_x(4, image_angle), y, 1, 1, image_angle, c_white, 1);
		break;
	case BOSS3_ABILITIES.SHIELD:
		draw_sprite_ext(spr_pickup_shieldbubble, 0, x + lengthdir_x(4, image_angle), y, 1, 1, image_angle, c_white, 1);
		break;
	case BOSS3_ABILITIES.BULLET_BLAST:
		draw_sprite_ext(spr_pickup_bulletblast, 0, x + lengthdir_x(4, image_angle), y, 1, 1, image_angle, c_white, 1);
		break;
	case BOSS3_ABILITIES.GROUND_POUND_SHOCKWAVE:
		break;
}
