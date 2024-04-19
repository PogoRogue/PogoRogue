key_back = global.key_back;

if key_back and !instance_exists(obj_fade_in) and global.credits_watched = true {
	scr_Room_Transition(room_menu);
	audio_play_sound(snd_unavailable,0,false);
}

yy -= 0.5;

draw_set_font(fnt_combo2);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

//if text is offscreen
if (yy + total_string_height + (string_separation*(array_length(credits_text_array)-1))) < -32 {
	scr_Room_Transition(room_menu);
	global.credits_watched = true;
	scr_Save_Real("credits_watched",global.credits_watched);
}