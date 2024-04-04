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
		case vk_backspace: return spr_backspace; break;
		case -1: return spr_button_empty; break;
		//text
		case vk_add: return "(+)"; break;
		case vk_alt: return "(alt)"; break;
		case vk_control: return "(ctrl)"; break;
		case vk_lcontrol: return "(lctrl)"; break;
		case vk_rcontrol: return "(rctrl)"; break;
		case vk_decimal: return "(.)"; break;
		case vk_delete: return "(del)"; break;
		case vk_divide: return "(/)"; break;
		case vk_end: return "(end)"; break;
		case vk_enter: return "(enter)"; break;
		case vk_escape: return "(esc)"; break;
		case vk_f1: return "(f1)"; break;
		case vk_f2: return "(f2)"; break;
		case vk_f3: return "(f3)"; break;
		case vk_f4: return "(f4)"; break;
		case vk_f5: return "(f5)"; break;
		case vk_f6: return "(f6)"; break;
		case vk_f7: return "(f7)"; break;
		case vk_f8: return "(f8)"; break;
		case vk_f9: return "(f9)"; break;
		case vk_f10: return "(f10)"; break;
		case vk_f11: return "(f11)"; break;
		case vk_f12: return "(f12)"; break;
		case vk_home: return "(home)"; break;
		case vk_insert: return "(ins)"; break;
		case vk_multiply: return "(*)"; break;
		case vk_numpad0: return "(num 0)"; break;
		case vk_numpad1: return "(num 1)"; break;
		case vk_numpad2: return "(num 2)"; break;
		case vk_numpad3: return "(num 3)"; break;
		case vk_numpad4: return "(num 4)"; break;
		case vk_numpad5: return "(num 5)"; break;
		case vk_numpad6: return "(num 6)"; break;
		case vk_numpad7: return "(num 7)"; break;
		case vk_numpad8: return "(num 8)"; break;
		case vk_numpad9: return "(num 9)"; break;
		case vk_pagedown: return "(pg down)"; break;
		case vk_pageup: return "(pg up)"; break;
		case vk_pause: return "(pause)"; break;
		case vk_printscreen: return "(prtsc)"; break;
		case vk_shift: return "(shift)"; break;
		case vk_subtract: return "(-)"; break;
		case vk_tab: return "(tab)"; break;
		default: return "(" + chr(key) + ")";
	}
}