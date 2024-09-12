/// @description type text
if (current_text != scrolling_text) and retract = false {
	current_character += 1;
	alarm[0] = 2;
	scrolling_text += string_char_at(current_text,current_character);
	play_sound = not play_sound;
	if play_sound = true {
		audio_play_sound(snd_dialogue,0,false);
	}
}

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_itemdescription2);