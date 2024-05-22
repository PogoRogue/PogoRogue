/// @description Prevent sequence breaking deaths

if(instance_exists(body) && body.hp <= 0) {
	switch(current_state) {
		case BOSS3_STATES.ATTACK_1:
			body.hp = body.hp_max * 0.75;
			break;
		case BOSS3_STATES.CHASE_1:
			body.hp = body.hp_max * 0.75;
			break;
		case BOSS3_STATES.ATTACK_2:
			body.hp = body.hp_max * 0.5;
			break;
		case BOSS3_STATES.CHASE_2:
			body.hp = body.hp_max * 0.5;
			break;
		case BOSS3_STATES.ATTACK_3:
			body.hp = body.hp_max * 0.25;
			break;
		case BOSS3_STATES.CHASE_3:
			body.hp = body.hp_max * 0.25;
			break;
	}
}
