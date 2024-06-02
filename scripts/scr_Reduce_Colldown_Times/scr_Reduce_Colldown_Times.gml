// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Reduce_Colldown_Times(time_reducedby){
	for(var i = 0; i < array_length(all_pickups_array); i++){
		if all_pickups_array[i].cooldown_time < all_pickups_array[i].max_cooldown_time and all_pickups_array[i].cooldown_time > 0 {
			all_pickups_array[i].cooldown_time -= time_reducedby;
			if all_pickups_array[i].cooldown_time <= 0 {
				all_pickups_array[i].cooldown_time = 0;
			}
		}	
	}
}