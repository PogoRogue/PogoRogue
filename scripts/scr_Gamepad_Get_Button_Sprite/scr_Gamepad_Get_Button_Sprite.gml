// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Gamepad_Get_Button_Sprite(button){
	switch (button) {
		case gp_face1:     return spr_button_d; break;
		case gp_face2:     return spr_button_r; break;
		case gp_face3:     return spr_button_l; break;
		case gp_face4:     return spr_button_u; break;
		case gp_start:     return spr_button_start; break;
		case gp_select:     return spr_button_select; break;
		case -10000: return spr_stick_l_l break;
		case -10001: return spr_stick_l_r break;
		case -10002: return spr_stick_l_u break;
		case -10003: return spr_stick_l_d break;
		case -10004: return spr_stick_r_l break;
		case -10005: return spr_stick_r_r break;
		case -10006: return spr_stick_r_u break;
		case -10007: return spr_stick_r_d break;
		case gp_axislh:     return spr_stick_l break;
		case gp_axislv:     return spr_stick_l; break;
		case gp_stickl:     return spr_stick_l; break;
		case gp_axisrh:     return spr_stick_r; break;
		case gp_axisrv:     return spr_stick_r; break;
		case gp_stickr:     return spr_stick_r; break;
		case gp_shoulderl:     return spr_bumper_l; break;
		case gp_shoulderlb:     return spr_trigger_l; break;
		case gp_shoulderr:     return spr_bumper_r; break;
		case gp_shoulderrb:     return spr_trigger_r; break;
		case gp_padu:     return spr_dpad_u; break;
		case gp_padl:     return spr_dpad_l; break;
		case gp_padr:     return spr_dpad_r; break;
		case gp_padd:     return spr_dpad_d; break;
		case 0: return spr_button_empty; break;
		default: return spr_button_empty; break;
	}
}