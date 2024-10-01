/// @description type text
if (current_text != scrolling_text) and retract = false {
	current_character += 1;
	alarm[0] = 2;
	scrolling_text += string_char_at(current_text,current_character);
	play_sound = not play_sound;
	if play_sound = true {
		randomize();
		audio_play_sound(choose(snd_droney1,snd_droney2,snd_droney3,snd_droney4,snd_droney5),0,false);
		random_set_seed(global.seed);
	}
}

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_itemdescription2);