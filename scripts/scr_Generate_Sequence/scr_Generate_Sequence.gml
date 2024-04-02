// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Generate_Sequence(_length) {
	color_index = 0;
	sequence = array_create(_length, [0]);
	
	last_index = -1;
	left_condition = false;
	right_condition = false;
	
	for(i = 0; i < _length; i++) {
		random_set_seed(global.seed+global.sequence_num);
		color_index = irandom(3);
		
		while(color_index == last_index) {
			color_index = irandom(3);
		}
		
		left_condition = left_condition || color_index <= 1;
		right_condition = right_condition || color_index >= 2;
		
		sequence[i] = color_index;
		global.sequence_num += 1;
		last_index = color_index;
	}
	
	if(!left_condition) {
		sequence[_length - 1] = irandom(1);
	}
	
	if(!right_condition) {
		sequence[_length - 1] = 2 + irandom(1);
	}
	
	return sequence;
	random_set_seed(global.seed);
}