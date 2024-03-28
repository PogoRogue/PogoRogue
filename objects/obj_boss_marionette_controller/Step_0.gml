/// @description Handle boss fight phases

// Force an inactive state if the boss is dead or doesn't exist
if(!instance_exists(body) || body.is_dead) {
	current_state = BOSS3_STATES.DEAD;
}

// Handle each phase of the boss fight
switch(current_state) {
	case BOSS3_STATES.INACTIVE:
		// Do nothing
		break;
	case BOSS3_STATES.ATTACK_1:
		body.anchor_y = lerp(body.anchor_y, attack_1_pos, 0.03);
		
		if(body.hp_percent <= 75) {
			with(obj_boss_marionette) {
				damage = 0;
			}
			current_state = BOSS3_STATES.CHASE_1;
		}
		
		/* Handle phase-specific attack scheduling here */
		
		break;
	case BOSS3_STATES.CHASE_1:
		if(state_has_changed) {
			instance_destroy(gate_1);
		}
		
		if(obj_player.y <= gate_pos_2 + 700) {
			with(obj_boss_marionette) {
				damage = 8;
			}
			current_state = BOSS3_STATES.ATTACK_2;
		}
		
		body.anchor_y += 9 * sign(attack_2_pos - body.anchor_y);
		body.hp = body.hp_max * 0.75;
		
		/* Handle phase-specific attack scheduling here */
		
		break;
	case BOSS3_STATES.ATTACK_2:
		if(state_has_changed) {
			body.anchor_y = attack_2_pos;
		}
		
		if(body.hp_percent <= 50) {
			with(obj_boss_marionette) {
				damage = 0;
			}
			current_state = BOSS3_STATES.CHASE_2;
		}
		
		/* Handle phase-specific attack scheduling here */
		
		break;
	case BOSS3_STATES.CHASE_2:
		if(state_has_changed) {
			instance_destroy(gate_2);
		}
		
		if(obj_player.y <= gate_pos_3 + 700) {
			with(obj_boss_marionette) {
				damage = 8;
			}
			current_state = BOSS3_STATES.ATTACK_3;
		}
		
		body.anchor_y += 9 * sign(attack_3_pos - body.anchor_y);
		body.hp = body.hp_max * 0.5;
		
		/* Handle phase-specific attack scheduling here */
		
		break;
	case BOSS3_STATES.ATTACK_3:
		if(state_has_changed) {
			body.anchor_y = attack_3_pos;
		}
		
		if(body.hp_percent <= 25) {
			with(obj_boss_marionette) {
				damage = 0;
			}
			current_state = BOSS3_STATES.CHASE_3;
		}
		
		/* Handle phase-specific attack scheduling here */
		
		break;
	case BOSS3_STATES.CHASE_3:
		if(state_has_changed) {
			instance_destroy(gate_3);
		}
		
		if(obj_player.y <= 1072) {
			with(obj_boss_marionette) {
				damage = 8;
			}
			current_state = BOSS3_STATES.ATTACK_4;
		}
		
		body.anchor_y += 9 * sign(attack_4_pos - body.anchor_y);
		body.hp = body.hp_max * 0.25;
		
		/* Handle phase-specific attack scheduling here */
		
		break;
	case BOSS3_STATES.ATTACK_4:
		if(state_has_changed) {
			body.anchor_y = attack_4_pos;
		}
		
		if(body.hp_percent <= 0) {
			current_state = BOSS3_STATES.DEAD;
		}
		
		/* Handle phase-specific attack scheduling here */
		
		break;
	case BOSS3_STATES.DEAD:
		// TODO: handle transition to credits
		break;
}

state_has_changed = previous_state != current_state;
previous_state = current_state;
