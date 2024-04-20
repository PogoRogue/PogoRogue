/// @description Swap ability (final phase)

switch(ability) {
	case BOSS3_ABILITIES.GROUND_POUND:
		ability = BOSS3_ABILITIES.SHIELD;
		break;
	case BOSS3_ABILITIES.BULLET_BLAST:
		ability = BOSS3_ABILITIES.GROUND_POUND;
		break;
	case BOSS3_ABILITIES.SHIELD:
		ability = BOSS3_ABILITIES.BULLET_BLAST;
		break;
}
