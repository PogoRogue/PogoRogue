/// @description retract
if activated = true {
	alarm_retracted = true;
	retract = true;
	audio_play_sound(snd_speechbubble_close,0,false);
	activated = false;
	type_text = false;
	animation_speed = 0.5;
	scrolling_text = "";
	current_character = 0;	
}