/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

shot_times += 1;

var current_audio = snd_nothing;

switch (shot_times) {
	case 0: current_audio = snd_combo1; break;
	case 1: current_audio = snd_combo1; break;
	case 2: current_audio = snd_combo2; break;
	case 3: current_audio = snd_combo3; break;
	case 4: current_audio = snd_combo4; break;
	case 5: current_audio = snd_combo5; break;
	case 6: current_audio = snd_combo6; break;
	case 7: current_audio = snd_combo7; break;
	case 8: current_audio = snd_combo8; break;
	case 9: current_audio = snd_combo9; break;
	case 10: current_audio = snd_combo10; break;
	case 11: current_audio = snd_combo10; break;
	case 12: current_audio = snd_combo10; break;
	default: current_audio = snd_combo10;
}

if current_audio != snd_nothing {
	audio_play_sound(current_audio,0,false,0.4);	
}