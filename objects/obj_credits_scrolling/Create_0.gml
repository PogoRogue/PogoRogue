instance_deactivate_all(true);
instance_activate_object(obj_steam);
if room = room_credits {
	instance_create_depth(x,y,depth,obj_fade_in);
}
if global.credits_watched = true or room = room_credits {
	instance_create_depth(x,y,depth,obj_gobacktomenu);
}
instance_create_depth(x,y,depth,obj_mastercontroller);

yy = 440;
y_offset = 0;
string_separation = 32;

draw_set_halign(fa_center);
draw_set_valign(fa_top);

font_add_enable_aa(false);
uranus = font_add("Uranus.ttf", 11, false, false, 32, 128);
lana = font_add("LanaPixel.ttf", 8, false, false, 32, 128);

artists_text_test = ["Artists:","Rogo Jones\nRogo Jones\nRogo Jones"];
engineers_text_test = ["Engineers:","Rogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones"];
designers_text_test = ["Designers:","Rogo Jones\nRogo Jones\nRogo Jones\nRogo Jones"];
producers_text_test = ["Producers:","Rogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones\nRogo Jones"];

ft1_artists_text = ["角色/物品设计组原画师", "Hannah Suchil\nIsaac White\nJiale Wei\nZekai Lu\nZiteng Zhao"];
ft1_designers_text = ["角色/物品设计组策划", "Isaac White\nMingzhe Zhu\nYuguang Shi"];
ft1_engineers_text = ["角色/物品设计组工程师", "Erik Zhang\nIsaac White\nYuguang Shi"]; 
ft1_player_engineer_text = ["玩家交互开发工程师", "Isaac White"];
ft1_lead_designer_text = ["主策划", "Isaac White"];
ft1_player_producers_text = ["角色/物品组项目管理", "Cleveland Parker\nIan Vokt\nIsaac White"];

ft2_artists_text = ["敌人设计组原画师", "Christian Almond\nKarsten Weller\nKim Nguyen"];
ft2_designers_text = ["敌人设计组策划", "Daniel He\nYuguang Shi\nZehao Chen"];
ft2_engineers_text = ["敌人设计组工程师", "Bingyan Xie\nDaniel He\nJohn Richard\nYuguang Shi"];
ft2_player_producers_text = ["敌人设计组项目管理", "John Richard"];

ft3_artists_text = ["关卡设计组原画师", "Daming Li\nHyeongkyu Kim"];
ft3_designers_text = ["关卡设计组策划", "Ian Vokt\nSam Klopstad\nTalen Stephens\nZehao Chen"];
ft3_engineers_text = ["关卡设计组工程师", "Cam Knight\nCayden Jensen\nRegie Topham"];
ft3_procgen_text = ["程序生成开发工程师", "Cam Knight\nCayden Jensen"];
ft3_player_producers_text = ["关卡设计组项目管理", "Regie Topham"];

ui_artists_text = ["UI美术", "Hannah Suchil\nHyeongkyu Kim\nIsaac White\nZekai Lu\nZiteng Zhao"];
ui_designers_text = ["UI设计师", "Isaac White"];
ui_engineers_text = ["UI工程师", "Isaac White"];

bg_artists_text = ["场景设计", "Daming Li\nZekai Lu"];
cg_artists_text = ["CG制作", "Christian Almond\nZekai Lu"];
promotional_artists_text = ["宣传原画师", "Daming Li\nKim Nguyen"];
art_polish_text = ["美术润色", "Daming Li\nKim Nguyen\nZekai Lu\nZiteng Zhao"];

music_text = ["音乐作曲", "Daisy Dai\nIsaac White"];
sound_text = ["音效设计", "Josiah Lin (LilLin)\nIsaac White"];
audio_dir_text = ["音频总监","Josiah Lin (LilLin)"];

translationteam_text = ["汉化翻译组", "Cleveland Parker\nIsaac White\nMingzhe Zhu\nZekai Lu"];
translators_text = ["翻译人员", "Mingzhe Zhu\nZekai Lu"];

marketing_text = ["市场经理", "Cleveland Parker"];
ur_text = ["用户调研", "Ian Vokt"];
art_narrative_text = ["美术和叙事管理", "Cleveland Parker"];
design_producer_text = ["策划项目管理", "Ian Vokt\nIsaac White"];
engineer_producers_text = ["工程项目管理", "John Richard\nRegie Topham"];
general_producers_text = ["综合项目管理", "Cleveland Parker\nIan Vokt\nIsaac White\nJohn Richard\nRegie Topham"];

special_thanks_text = ["特别鸣谢", "Protostar777\nAbby M\nAlex M\nArchie and Betty\nBrendan L\nBrenna V\nBritt T\nChristina V\nColin V\nDan V\nDraik04\nDylan B\nEddieTheYeti\nEric V\nErik R \nEvan A\nFergus and Gracie\nFrancis W\nGabe F\nJack S\nJess B\nJess R\nJesse H\nJi-hoon T\nJon R\nJordon M\nJoshua R\nJulie V\nKalistapie\nKarifu\nKimball B\nLauren A\nLuke C\nMakaveli\nMarshmallow and Tanuki\nMatt T\nMistakeSenpai\nMr. Orange Cat President Natsu\nNessie\nOwen T\nPayton H\nPriscillia S\nQuinn\nRay P\nRichiachu\nRick S\nRogo Jones\nRuby M\nScott W\nSora R\nStacey W\nStephen H\nStrawbs\nSusan V\nTerry D\nTerry W\nThomas W\nTylerintn\nUsagi M\nWill T\nZorpy\n\nThe IGDA - Utah Chapter for letting us display our game!\n\nBerklee College of Music for our partnership!"];

capstone_text = ["其他毕设制作组（位于犹他大学）",""];

studio_1_text = ["","Bucket Under A Bucket Studios\nCreators of 'Trash Pandamonium'"];
studio_2_text = ["","Dawesome Studios\nCreators of 'Digital Audio Wasteland'"];
studio_3_text = ["","Infamous Grog\nCreators of 'Barnacles, Beers and Brawls'"];
studio_4_text = ["","Infinite Digital Monkeys LLC\nCreators of 'Syke!'"];
studio_5_text = ["","Inquiry Games\nCreators of 'Ivorfall'"];
studio_6_text = ["","Murky Waters Studios\nCreators of 'Terror on the Bayou'"];
studio_7_text = ["","Resting Place Games\nCreators of 'My Little Cemetery'"];

ta_text = ["助教","Carly Henry\nCraig Nash\nSteven Pasinsky\nYeshwanth Sai Kandula"];
professors_text = ["教授","Fernando Rodriguez\nGreg Bayles"];

classmates_text = ["我们在犹他大学的同学们",spr_photo_class];

outro_1_text = ["","以及最后还有……"];
outro_2_text = ["","您！"];
outro_3_text = ["","感谢游玩我们的游戏！"];
outro_4_text = ["","本工作室全体成员在这里向您表示诚挚的感谢！"];
outro_5_text = ["",spr_photo_team];

if room = room_credits_scrolling {
	credits_text_array = [ft1_artists_text,ft1_designers_text,ft1_engineers_text,ft1_player_engineer_text,ft1_player_producers_text,ft1_lead_designer_text,
						ft2_artists_text,ft2_designers_text,ft2_engineers_text,ft2_player_producers_text,
						ft3_artists_text,ft3_designers_text,ft3_engineers_text,ft3_player_producers_text,
						ui_artists_text,ui_designers_text,ui_engineers_text,
						bg_artists_text,cg_artists_text,promotional_artists_text,art_polish_text,
						music_text,sound_text,audio_dir_text,
						translationteam_text,translators_text,
						marketing_text, ur_text, art_narrative_text, design_producer_text, engineer_producers_text, general_producers_text,
						special_thanks_text,
						capstone_text,studio_1_text,studio_2_text,studio_3_text,studio_4_text,studio_5_text,studio_6_text,studio_7_text,
						ta_text,professors_text,
						classmates_text,outro_1_text,outro_2_text,outro_3_text,outro_4_text,outro_5_text];
}else {
	credits_text_array = [ft1_artists_text,ft1_designers_text,ft1_engineers_text,ft1_player_engineer_text,ft1_player_producers_text,ft1_lead_designer_text,
					ft2_artists_text,ft2_designers_text,ft2_engineers_text,ft2_player_producers_text,
					ft3_artists_text,ft3_designers_text,ft3_engineers_text,ft3_procgen_text,ft3_player_producers_text,
					ui_artists_text,ui_designers_text,ui_engineers_text,
					bg_artists_text,cg_artists_text,promotional_artists_text,art_polish_text,
					music_text,sound_text,audio_dir_text,
					translationteam_text,translators_text,
					marketing_text, ur_text, art_narrative_text, design_producer_text, engineer_producers_text, general_producers_text,
					special_thanks_text,
					capstone_text,studio_1_text,studio_2_text,studio_3_text,studio_4_text,studio_5_text,studio_6_text,studio_7_text,
					ta_text,professors_text];
}
total_string_height = 0;
for (i = 0; i < array_length(credits_text_array); i++) {
	for (j = 0; j <= 1; j++) {
		if j = 0 {
			draw_set_font(global.uranus);//	
		}else {
			draw_set_font(global.uranus);	
		}
		if is_string(credits_text_array[i][j]) {
			total_string_height += string_height(credits_text_array[i][j]);
		}else if j = 1 {
			total_string_height += sprite_get_height(credits_text_array[i][j]);
		}
	}
}

if global.credits_watched = true {
	credits_already_watched = true;	
}else {
	credits_already_watched = false;
}

audio_group_stop_all(audiogroup_music);
audio_play_sound(snd_music_credits,0,true);
audio_group_set_gain(audiogroup_music, ((exp(0.24*((10 / 100) * global.music_volume))-1)/10), 1);