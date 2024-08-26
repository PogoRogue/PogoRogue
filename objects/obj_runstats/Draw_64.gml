/// @description draw splits
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_font(fnt_combo2);

if global.show_splits = true and global.show_timer = false {
	var x_offset = 0;
}else if global.show_splits = true and global.show_timer = true {
	var x_offset = 64;
}

if global.show_splits = true {
	if room = room_proc_gen_test {
		if global.phase = 1 {
			scr_Draw_Text_Outlined(123-1+x_offset,66+1,scr_Convert_Frames_To_Time(global.current_time_elapsed_area1),c_white);
		}else if global.phase = 2 {
			scr_Draw_Text_Outlined(123-1+x_offset,66+1,scr_Convert_Frames_To_Time(global.current_time_elapsed_area2),c_white);
		}else if global.phase = 3 {
			scr_Draw_Text_Outlined(123-1+x_offset,66+1,scr_Convert_Frames_To_Time(global.current_time_elapsed_area3),c_white);
		}
		draw_sprite(spr_timergui_small,0,123+x_offset,66);
	}else if room = room_boss_1 or room = room_shop and global.last_room = room_boss_1 {
		scr_Draw_Text_Outlined(123-1+x_offset,66+1,scr_Convert_Frames_To_Time(global.current_time_elapsed_boss1),c_white);
		draw_sprite(spr_timergui_small,0,123+x_offset,66);
	}else if room = room_boss_2 and global.last_room = room_boss_2 {
		scr_Draw_Text_Outlined(123-1+x_offset,66+1,scr_Convert_Frames_To_Time(global.current_time_elapsed_boss3),c_white);
		draw_sprite(spr_timergui_small,0,123+x_offset,66);
	}else if room = room_boss_3 and global.last_room = room_boss_3 {
		scr_Draw_Text_Outlined(123-1+x_offset,66+1,scr_Convert_Frames_To_Time(global.current_time_elapsed_boss5),c_white);
		draw_sprite(spr_timergui_small,0,123+x_offset,66);
	}else {
		//scr_Draw_Text_Outlined(123-1+x_offset,66+1,scr_Convert_Frames_To_Time(global.current_time_elapsed),c_white);
	}
}