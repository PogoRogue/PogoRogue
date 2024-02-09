if global.use_controller = true {
	draw_sprite(scr_Gamepad_Get_Button_Sprite(scr_Gamepad_Get_Button()),0,x,y);
}else {
	if scr_In_Array(global.keyboard_sprites_array,keyboard_key) {
		//sprites
		draw_sprite(scr_Keyboard_Get_Key_String(keyboard_key),0,x,y);
	}else {
		//text
		draw_set_font(fnt_item_popup);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text(x,y,scr_Keyboard_Get_Key_String(keyboard_key));
	}
	draw_sprite(scr_Mouse_Get_Button_Sprite(mouse_button),0,x,y);
}