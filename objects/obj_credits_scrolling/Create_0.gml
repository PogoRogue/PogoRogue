instance_deactivate_all(true);
instance_create_depth(x,y,depth,obj_fade_in);
if global.credits_watched = true {
	instance_create_depth(x,y,depth,obj_gobacktomenu);
}
instance_create_depth(x,y,depth,obj_mastercontroller);

yy = 440;
y_offset = 0;
string_separation = 32;

draw_set_font(fnt_combo2);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

credits_text1 = "Artists:\n\nRogo Jones\nRogo Jones\nRogo Jones";
credits_text2 = "Engineers:\n\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones";
credits_text3 = "Designers:\n\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones";
credits_text4 = "Producers:\n\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones";
total_string_height = string_height(credits_text1) + string_height(credits_text2) + string_height(credits_text3) + string_height(credits_text4);

credits_text_array = [credits_text1,credits_text2,credits_text3,credits_text4];

audio_group_stop_all(audiogroup_music);
audio_play_sound(snd_music_credits,0,false);