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
		if(state_has_changed) {
			body.weapon = BOSS3_WEAPONS.PISTOL;
			body.ability = BOSS3_ABILITIES.GROUND_POUND;
		}
		
		body.anchor_y = lerp(body.anchor_y, attack_1_pos, 0.03);
		
		if(body.hp_percent <= 75) {			
			current_state = BOSS3_STATES.CHASE_1;
		}
		
		break;
	case BOSS3_STATES.CHASE_1:
		if(state_has_changed) {
			with(obj_boss_marionette) {
				sprite_index = spr_boss_marionette_phase2;
				damage = 0;
			}
			
			with(obj_boss_marionette_leg) {
				if(leg_num == 2) {
					instance_destroy(self);
				}
			}
			
			body.weapon = BOSS3_WEAPONS.NONE;
			body.ability = BOSS3_ABILITIES.NONE;
			instance_destroy(gate_1);
			instance_create_layer(0, 0, "enemies", obj_chase_projectile_spawner);
		}
		
		if(obj_player.y <= gate_pos_2 + 700) {
			current_state = BOSS3_STATES.ATTACK_2;
		}
		
		body.anchor_y += 9 * sign(attack_2_pos - body.anchor_y);
		body.hp = body.hp_max * 0.75;
		
		break;
	case BOSS3_STATES.ATTACK_2:
		if(state_has_changed) {
			with(obj_boss_marionette) {
				damage = 8;
			}
			
			body.weapon = BOSS3_WEAPONS.SHOTGUN;
			body.ability = BOSS3_ABILITIES.BULLET_BLAST;
			body.anchor_y = attack_2_pos;
			instance_destroy(obj_chase_projectile_spawner);
		}
		
		if(body.hp_percent <= 50) {
			current_state = BOSS3_STATES.CHASE_2;
		}
		
		break;
	case BOSS3_STATES.CHASE_2:
		if(state_has_changed) {
			with(obj_boss_marionette) {
				sprite_index = spr_boss_marionette_phase3;
				damage = 0;
			}
			
			with(obj_boss_marionette_leg) {
				instance_destroy(self);
			}
			
			with(obj_boss_marionette_thigh) {
				if(leg_num == 1) {
					instance_destroy(self);
				}
			}
			
			body.weapon = BOSS3_WEAPONS.NONE;
			body.ability = BOSS3_ABILITIES.NONE;
			instance_destroy(gate_2);
			instance_create_layer(0, 0, "enemies", obj_chase_projectile_spawner);
		}
		
		if(obj_player.y <= gate_pos_3 + 700) {
			current_state = BOSS3_STATES.ATTACK_3;
		}
		
		body.anchor_y += 9 * sign(attack_3_pos - body.anchor_y);
		body.hp = body.hp_max * 0.5;
		
		break;
	case BOSS3_STATES.ATTACK_3:
		if(state_has_changed) {
			with(obj_boss_marionette) {
				damage = 8;
			}
			
			body.weapon = BOSS3_WEAPONS.MISSILE;
			body.ability = BOSS3_ABILITIES.SHIELD;
			body.anchor_y = attack_3_pos;
			instance_destroy(obj_chase_projectile_spawner);
		}
		
		if(body.hp_percent <= 25) {
			current_state = BOSS3_STATES.CHASE_3;
		}
		
		break;
	case BOSS3_STATES.CHASE_3:
		if(state_has_changed) {
			with(obj_boss_marionette) {
				sprite_index = spr_boss_marionette_phase4;
				damage = 0;
			}
			
			with(obj_boss_marionette_thigh) {
				instance_destroy(self);
			}
			
		
			body.weapon = BOSS3_WEAPONS.NONE;
			body.ability = BOSS3_ABILITIES.NONE;
			instance_destroy(obj_shield_plus);
			instance_destroy(gate_3);
			instance_create_layer(0, 0, "enemies", obj_chase_projectile_spawner);
		}
		
		if(obj_player.y <= 1072) {
			current_state = BOSS3_STATES.ATTACK_4;
		}
		
		body.anchor_y += 9 * sign(attack_4_pos - body.anchor_y);
		body.hp = body.hp_max * 0.25;
		
		break;
	case BOSS3_STATES.ATTACK_4:
		if(state_has_changed) {
			with(obj_boss_marionette) {
				stomp_defense = 0.8;
				bullet_defense = 0.8;
				explosion_defense = 0.8;
				damage = 8;
			}
			
			body.weapon = BOSS3_WEAPONS.LASER;
			body.ability = BOSS3_ABILITIES.SHIELD;
			body.anchor_y = attack_4_pos;
			instance_destroy(obj_chase_projectile_spawner);
		}
		
		if(body.hp_percent <= 0) {
			current_state = BOSS3_STATES.DEAD;
		}
		
		break;
	case BOSS3_STATES.DEAD:
		if(state_has_changed) {
			with(obj_boss_marionette) {
				sprite_index = spr_boss_marionette_death;
				image_index = 0;
				damage = 0;
			}
		}
		break;
}

state_has_changed = previous_state != current_state;
previous_state = current_state;