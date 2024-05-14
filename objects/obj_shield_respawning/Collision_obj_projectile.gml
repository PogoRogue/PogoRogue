/// @description Deactivate shield

if other.destroy_on_impact = true {
	if(is_active){
		is_active = false;
		instance_destroy(other);
		alarm_set(0, restore_duration);
		parent.current_iframes = 25;
		audio_play_sound(snd_bubblepop,0,false);
		with parent {
			immune = true;
			mask_index = spr_nothing;
			alarm[1] = 10;
			temp_hp = hp;
		}
	}
}
