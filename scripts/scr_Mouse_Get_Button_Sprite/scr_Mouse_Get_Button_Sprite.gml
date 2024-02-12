// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Mouse_Get_Button_Sprite(mb){
	switch(mb) {
		//sprites
		case mb_left: return spr_mouse_left; break;
		case mb_right: return spr_mouse_right; break;
		case mb_middle: return spr_mouse_middle; break;
		case mb_side1: return spr_mouse_side1; break;
		case mb_side2: return spr_mouse_side2; break;
		default: return spr_nothing;
	}
}