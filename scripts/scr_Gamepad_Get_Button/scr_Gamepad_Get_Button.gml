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
				if i = gp_axislh {
					if gamepad_axis_value(0,gp_axislh) < -0.75 {
						return "gp_axislhl";
					}else if gamepad_axis_value(0,gp_axislh) > 0.75 {
						return "gp_axislhr";
					}else {
						return 0;
					}
				}
				if i = gp_axislv {
					if gamepad_axis_value(0,gp_axislv) < -0.75 {
						return "gp_axislvu";
					}else if gamepad_axis_value(0,gp_axislv) > 0.75 {
						return "gp_axislvd";
					}else {
						return 0;
					}
				}
				if i = gp_axisrh {
					if gamepad_axis_value(0,gp_axisrh) < -0.75 {
						return "gp_axisrhl";
					}else if gamepad_axis_value(0,gp_axisrh) > 0.75 {
						return "gp_axisrhr";
					}else {
						return 0;
					}
				}
				if i = gp_axisrv {
					if gamepad_axis_value(0,gp_axisrv) < -0.75 {
						return "gp_axisrvu";
					}else if gamepad_axis_value(0,gp_axisrv) > 0.75 {
						return "gp_axisrvd";
					}else {
						return 0;
					}
				}
				
			}
		}
	}
	return 0;
}