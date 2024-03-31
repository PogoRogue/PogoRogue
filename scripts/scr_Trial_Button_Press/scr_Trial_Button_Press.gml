// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Trial_Button_Press(){
	with(obj_boss_sequence_trial) {
		player_sequence[sequence_index] = other.button_id;
		sequence_index++;
	}
}