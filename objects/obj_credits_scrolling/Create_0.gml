instance_deactivate_all(true);
instance_create_depth(x,y,depth,obj_fade_in);
if global.credits_watched = true {
	instance_create_depth(x,y,depth,obj_gobacktomenu);
}
instance_create_depth(x,y,depth,obj_mastercontroller);

yy = 440;
y_offset = 0;
string_separation = 32;

draw_set_halign(fa_center);
draw_set_valign(fa_top);

artists_text_test = ["Artists:","Rogo Jones\nRogo Jones\nRogo Jones"];
engineers_text_test = ["Engineers:","Rogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones"];
designers_text_test = ["Designers:","Rogo Jones\nRogo Jones\nRogo Jones\nRogo Jones"];
producers_text_test = ["Producers:","Rogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones"];

ft1_artists_text = ["Character / Items Team Artists", "Hannah Suchil\nIsaac White\nJiale Wei\nZekai Lu\nZiteng Zhao"];
ft1_designers_text = ["Character / Items Team Designers", "Isaac White\nMingzhe Zhu\nYuguang Shi"];
ft1_engineers_text = ["Character / Items Team Engineers", "Erik Zhang\nIsaac White\nYuguang Shi"]; 
ft1_player_engineer_text = ["Player Mechanics Engineer", "Isaac White"];
ft1_player_producers_text = ["Character / Items Team Producers", "Cleveland Parker\nIan Vokt\nIsaac White"];

ft2_artists_text = ["Enemies Team Artists", "Christian Almond\nKarsten Weller\nKim Nguyen"];
ft2_designers_text = ["Enemies Team Designers", "Daniel He\nYuguang Shi\nZehao Chen"];
ft2_engineers_text = ["Enemies Team Engineers", "Bingyan Xie\nDaniel He\nJohn Richard\nYuguang Shi"];
ft2_player_producers_text = ["Enemies Team Producer", "John Richard"];

ft3_artists_text = ["Level Team Artists", "Daming Li\nHyeongkyu Kim"];
ft3_designers_text = ["Level Team Designers", "Ian Vokt\nSam Klopstad\nTalen Stephens\nZehao Chen"];
ft3_engineers_text = ["Level Team / Proc Gen Engineers", "Cam Knight\nCayden Jensen\nRegie Topham"];
ft3_player_producers_text = ["Level Team Producer", "Regie Topham"];

ui_artists_text = ["UI Artists", "Hannah Suchil\nHyeongkyu Kim\nIsaac White\nZekai Lu\nZiteng Zhao"];
ui_designers_text = ["UI Designer", "Isaac White"];
ui_engineers_text = ["UI Engineer", "Isaac White"];

bg_artists_text = ["Background Artists", "Daming Li\nZekai Lu"];
cg_artists_text = ["CG Artists", "Christian Almond\nZekai Lu"];
promotional_artists_text = ["Promotional Artists", "Daming Li\nKim Nguyen"];
art_polish_text = ["Art Polish Team", "Daming Li\nKim Nguyen\nZekai Lu\nZiteng Zhao"];

music_text = ["Music Composer", "Daisy Dai"];
sound_text = ["Sound Designer", "Josiah Lin"];

marketing_text = ["Marketing Manager", "Cleveland Parker"];
ur_text = ["User Researcher", "Ian Vokt"];
art_narrative_text = ["Art / Narrative Producer", "Cleveland Parker"];
design_producer_text = ["Design Producers", "Ian Vokt\nIsaac White"];
engineer_producers_text = ["Engineering Producers", "John Richard\nRegie Topham"];
general_producers_text = ["General Producers", "Cleveland Parker\nIan Vokt\nIsaac White\nJohn Richard\nRegie Topham"];

special_thanks_text = ["Special Thanks", "Protostar777 for his help in finding so many bugs\nAbby M\nAlex M\nBrendan L\nBrenna V\nChristina V\nColin V\nDan V\nDraik04\nDylan B\nEddieTheYeti\nEric V\nErik R \nEvan A\nFrancis W\nJess B\nJesse H\nJi-hoon T\nJon R\nJordon M\nJoshua R\nJulie V\nKalistapie\nKarifu\nKimball B\nLuke C\nMakaveli\nMatt T\nMistakeSenpai\nMr. Orange Cat President Natsu\nNessie\nOwen T\nPayton H\nQuinn\nRay\nRichiachu\nRogo Jones\nRonnie F\nRuby M\nScott W\nSora R\nStacey W\nStephen H\nSusan V\nTerry D\nTerry W\nThe Suchils\nThomas W\nTylerintn\nUsagi M\nWill T\n\nThe IGDA - Utah Chapter for letting us display our game!"];

credits_text_array = [ft1_artists_text,ft1_designers_text,ft1_engineers_text,ft1_player_engineer_text,ft1_player_producers_text,
					ft2_artists_text,ft2_designers_text,ft2_engineers_text,ft2_player_producers_text,
					ft3_artists_text,ft3_designers_text,ft3_engineers_text,ft3_player_producers_text,
					ui_artists_text,ui_designers_text,ui_engineers_text,
					bg_artists_text,cg_artists_text,promotional_artists_text,art_polish_text,
					music_text,sound_text,
					marketing_text, ur_text, art_narrative_text, design_producer_text, engineer_producers_text, general_producers_text,
					special_thanks_text];
total_string_height = 0;
for (i = 0; i < array_length(credits_text_array); i++) {
	for (j = 0; j <= 1; j++) {
		if j = 0 {
			draw_set_font(fnt_item_popup);	
		}else {
			draw_set_font(fnt_combo2);	
		}
		total_string_height += string_height(credits_text_array[i][j]);
	}
}

audio_group_stop_all(audiogroup_music);
audio_play_sound(snd_music_credits,0,false);