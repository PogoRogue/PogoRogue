key_back = global.key_back;
key_down = global.key_down_menu;
key_up = global.key_up_menu;

if key_back and !instance_exists(obj_fade_in) and global.credits_watched = true and room = room_credits_scrolling {
	scr_Room_Transition(room_menu);
	audio_play_sound(snd_unavailable,0,false);
}else if key_back and !instance_exists(obj_fade_in) and room = room_credits {
	scr_Room_Transition(room_menu);
	audio_play_sound(snd_unavailable,0,false);
}

yy -= 0.5;

if key_down {
	yy -= 2.5;
}

draw_set_font(fnt_combo2);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

//if text is offscreen
if (yy + total_string_height + (string_separation*(array_length(credits_text_array)-1))) < -32 {
	scr_Room_Transition(room_menu);
	if room = room_credits_scrolling {
		global.credits_watched = true;
		scr_Save_Real("credits_watched",global.credits_watched);
	}
}