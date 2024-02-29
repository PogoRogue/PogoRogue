// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_In_Array_Value(array,value){
	jj = 0;
	j = 0;
	
	for (j = 0; j < array_length(array); j++) {
		if array[j] = value {
			jj++;
			break;
		}
		j += 1;
	}
	
	if jj > 0 {
		return j;
	}else {
		return -1;	
	}
}