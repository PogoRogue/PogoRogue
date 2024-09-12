// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Gamepad_Get_Button(){
	if global.use_controller {
		for (var i=gp_face1;i<=gp_padr;i++) { //see gp_strings - loop all buttons
			if gamepad_button_check(0,i) { 
				return i;
			}
		}
		for (var i=gp_axislh;i<=gp_axisrv;i++) {    // loop analogue axis
			if gamepad_axis_value(0,i) !=0 {
				if gamepad_axis_value(0,gp_axislh) < -0.75 {
					return -10000;
				}else if gamepad_axis_value(0,gp_axislh) > 0.75 {
					return -10001;
				}else if gamepad_axis_value(0,gp_axislv) < -0.75 {
					return -10002;
				}else if gamepad_axis_value(0,gp_axislv) > 0.75 {
					return -10003;
				}else if gamepad_axis_value(0,gp_axisrh) < -0.75 {
					return -10004;
				}else if gamepad_axis_value(0,gp_axisrh) > 0.75 {
					return -10005;
				}else if gamepad_axis_value(0,gp_axisrv) < -0.75 {
					return -10006;
				}else if gamepad_axis_value(0,gp_axisrv) > 0.75 {
					return -10007;
				}else {
					return 0;
				}
			}
		}
	}
	return 0;
}