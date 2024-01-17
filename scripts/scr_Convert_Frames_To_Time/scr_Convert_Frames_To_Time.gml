// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Convert_Frames_To_Time(frames) {
	var hours = floor(frames/216000); //convert milliseconds to hours
	var minutes = floor((frames - (hours*216000))/3600); //convert milliseconds to minutes
	var seconds = floor((frames - (hours*216000) - (minutes*3600))/60); //convert milliseconds to seconds
	var milliseconds = round((frames - (hours*216000) - (minutes*3600) - (seconds*60))*(100/60));

	if seconds < 10 {
		var zero = "0";	
	}else {
		var zero = "";	
	}
	
	//convert to string
	if (hours > 0) {
		return (string(hours) + ":" + string(minutes) + ":" + zero + string(seconds) + "." + string(milliseconds));
	}else {
		return (string(minutes) + ":" + zero + string(seconds) + "." + string(milliseconds));
	}
}