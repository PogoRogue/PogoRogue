function scr_In_Nested_Array(array,value,ignore_value) {
	kk = 0;
	
	for (j = 0; j < array_length(array); j++) {
		for (k = 0; k < array_length(array[j]); k++) {
			if (array[j][k] = value) and (j != ignore_value) {
				kk++;
			}
		}
	}
	
	if kk = 0 {
		return false;
	}else {
		return true;
	}
}