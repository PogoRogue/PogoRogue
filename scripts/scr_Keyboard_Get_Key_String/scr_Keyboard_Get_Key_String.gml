// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Keyboard_Get_Key_String(key){
	
	switch(key) {
		//sprites
		case vk_up: return spr_arrow_up; break;
		case vk_down: return spr_arrow_down; break;
		case vk_left: return spr_arrow_left; break;
		case vk_right: return spr_arrow_right; break;
		case vk_space: return spr_spacebar; break;
		//text
		case vk_add: return "+"; break;
		case vk_alt: return "Alt"; break;
		case vk_backspace: return "Backspace"; break;
		case vk_control: return "Ctrl"; break;
		case vk_lcontrol: return "LCtrl"; break;
		case vk_rcontrol: return "RCtrl"; break;
		case vk_decimal: return "."; break;
		case vk_delete: return "Del"; break;
		case vk_divide: return "/"; break;
		case vk_end: return "End"; break;
		case vk_enter: return "Enter"; break;
		case vk_escape: return "Esc"; break;
		case vk_f1: return "F1"; break;
		case vk_f2: return "F2"; break;
		case vk_f3: return "F3"; break;
		case vk_f4: return "F4"; break;
		case vk_f5: return "F5"; break;
		case vk_f6: return "F6"; break;
		case vk_f7: return "F7"; break;
		case vk_f8: return "F8"; break;
		case vk_f9: return "F9"; break;
		case vk_f10: return "F10"; break;
		case vk_f11: return "F11"; break;
		case vk_f12: return "F12"; break;
		case vk_home: return "Home"; break;
		case vk_insert: return "Ins"; break;
		case vk_multiply: return "*"; break;
		case vk_numpad0: return "Numpad 0"; break;
		case vk_numpad1: return "Numpad 1"; break;
		case vk_numpad2: return "Numpad 2"; break;
		case vk_numpad3: return "Numpad 3"; break;
		case vk_numpad4: return "Numpad 4"; break;
		case vk_numpad5: return "Numpad 5"; break;
		case vk_numpad6: return "Numpad 6"; break;
		case vk_numpad7: return "Numpad 7"; break;
		case vk_numpad8: return "Numpad 8"; break;
		case vk_numpad9: return "Numpad 9"; break;
		case vk_pagedown: return "PgDn"; break;
		case vk_pageup: return "PgUp"; break;
		case vk_pause: return "Pause"; break;
		case vk_printscreen: return "PrtSc"; break;
		case vk_shift: return "Shift"; break;
		case vk_subtract: return "-"; break;
		case vk_tab: return "Tab"; break;
		default: return chr(key);
	}
}