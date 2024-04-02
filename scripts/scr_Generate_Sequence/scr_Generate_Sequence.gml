// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Generate_Sequence(length){
	
	var color_index = 0;
	var sequence = array_create(length, [0]);
	
	for(i = 0; i < length; i++) {
		random_set_seed(global.seed+global.sequence_num);
		color_index = irandom(3);
		sequence[i] = color_index;
		global.sequence_num += 1;
	}
	
	return sequence;
	random_set_seed(global.seed);
}