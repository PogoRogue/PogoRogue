/// @description Insert description here
// You can write your code in this editor

enum BOSS3_STATES
{
	INACTIVE,
	ATTACK_1,
	CHASE_1,
	ATTACK_2,
	CHASE_2,
	ATTACK_3,
	CHASE_3,
	ATTACK_4,
	DEAD,
}

current_state = BOSS3_STATES.INACTIVE;
previous_state = current_state;
state_has_changed = false;

/*
 * The positioning of the following objects are based on this outline
 * 
 *	AREA		HEIGHT		TOTAL HEIGHT
 * --------------------------------------
 *	‾‾‾ TOP		0 px		0 px
 *	--  FIGHT4	864 px		864 px
 *  ||
 *	||	GAP		3008 px		3872 px	
 *  ||
 *	--  FIGHT3	432 px 		4304 px
 *  ||
 *	||	GAP		3008 px		7312 px
 *  ||
 *	--  FIGHT2	432 px		7744 px
 *  || 
 *	||	GAP		3008 px		10752 px
 *  ||
 *	--  FIGHT1	432 px		11184 px
 *	___ BOTTOM	32 px		11216 px
 */
 
// These determine the anchor for the boss's body
attack_1_pos = 10308; // Gate 1 - 444 px
attack_2_pos = 6868;  // Gate 2 - 444 px
attack_3_pos = 3428;  // Gate 3 - 444 px
attack_4_pos = 0;

body = instance_create_layer(384, attack_2_pos, "enemies", obj_boss_marionette);

// These are the gate positions
gate_pos_1 = 10752;
gate_pos_2 = 7312;
gate_pos_3 = 3872;

gate_1 = instance_create_layer(160, gate_pos_1, "enemies", obj_boss_gate_close);
gate_2 = instance_create_layer(160, gate_pos_2, "enemies", obj_boss_gate_close);
gate_3 = instance_create_layer(160, gate_pos_3, "enemies", obj_boss_gate_close);
