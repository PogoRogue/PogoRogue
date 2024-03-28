// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Boss_Button_Press(){
	with(obj_boss_sequence) {
		if(current_state == BOSS2_STATES.ATTACKING) {
			player_sequence[sequence_index] = other.button_id;
			sequence_index++;
		}
	}
}