function scr_In_Array(array,value) {
	jj = 0;
	
	for (j = 0; j < array_length(array); j++) {
		if array[j] = value {
			jj++;
		}
	}
	
	if jj = 0 {
		return false;
	}else {
		return true;
	}
}