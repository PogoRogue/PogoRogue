/// @description Draw puppet string

draw_line_width_color(boss.anchor_x, boss.anchor_y, x + lengthdir_x(32, image_angle), y + lengthdir_y(32, image_angle), 1, #868188, #868188);

draw_self();

switch(boss.weapon) {
	case BOSS3_WEAPONS.NONE:
		break;
	case BOSS3_WEAPONS.PISTOL:
		draw_sprite_ext(spr_gun_default, 0, weapon_x, weapon_y, 1, sign(weapon_x - x), image_angle, c_white, 1);
		break;
	case BOSS3_WEAPONS.SHOTGUN:
		draw_sprite_ext(spr_gun_shotgun, 0, weapon_x, weapon_y, 1, sign(weapon_x - x), image_angle, c_white, 1);
		break;
	case BOSS3_WEAPONS.MISSILE:
		draw_sprite_ext(spr_gun_missile, 0, weapon_x, weapon_y, 1, sign(weapon_x - x), image_angle, c_white, 1);
		break;
	case BOSS3_WEAPONS.BOUNCY:
		break;
	case BOSS3_WEAPONS.JAVALIN:
		break;
	case BOSS3_WEAPONS.BUBBLE:
		break;
	case BOSS3_WEAPONS.BOOMERANG:
		break;
	case BOSS3_WEAPONS.GRENADE:
		break;
}
