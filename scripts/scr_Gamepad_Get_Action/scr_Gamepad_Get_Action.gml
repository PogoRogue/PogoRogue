// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Gamepad_Get_Action(button,action_type){
	//key = the specific key/mouse button
	//action_type = the type of action to return ("check", "pressed", "released")
	
	var _input_type = "none";
	
	for (var i=gp_face1;i<=gp_padr;i++) { //loop all buttons
		if (i = button) { 
			_input_type = "buttons";
			break;
		}else if (button != -1) {
			_input_type = "joystick";
		}else {
			_input_type = "none";	
		}
	}
	
	if (_input_type = "buttons") { //gamepad buttons
		if action_type = "check" {
			return gamepad_button_check(0,button);
		}else if action_type = "pressed" {
			return gamepad_button_check_pressed(0,button);
		}else if action_type = "released" {
			return gamepad_button_check_released(0,button);
		}else {
			return 0;	
		}
	}else if (_input_type = "joystick") { //gamepad joysticks
		scr_Joysticks(obj_controls_controller.joystick_left_lr,obj_controls_controller.joystick_left_ud,obj_controls_controller.joystick_right_lr,obj_controls_controller.joystick_right_ud,action_type,button); //get check, pressed, and released value of joystick directions
		
		if action_type = "check" {
			
			switch (button) {
				case "gp_axislhl": return _gp_axislhl; break;
				case "gp_axislhr": return _gp_axislhr; break;
				case "gp_axislvu": return _gp_axislvu; break;
				case "gp_axislvd": return _gp_axislvd; break;
				case "gp_axisrhl": return _gp_axisrhl; break;
				case "gp_axisrhr": return _gp_axisrhr; break;
				case "gp_axisrvu": return _gp_axisrvu; break;
				case "gp_axisrvd": return _gp_axisrvd; break;
				default: return 0;
			}
		}else if action_type = "pressed" {
			
			switch (button) {
				case "gp_axislhl": return _gp_axislhl_pressed; break;
				case "gp_axislhr": return _gp_axislhr_pressed; break;
				case "gp_axislvu": return _gp_axislvu_pressed; break;
				case "gp_axislvd": return _gp_axislvd_pressed; break;
				case "gp_axisrhl": return _gp_axisrhl_pressed; break;
				case "gp_axisrhr": return _gp_axisrhr_pressed; break;
				case "gp_axisrvu": return _gp_axisrvu_pressed; break;
				case "gp_axisrvd": return _gp_axisrvd_pressed; break;
				default: return 0;
			}
			
		}else if action_type = "released" {

			switch (button) {
				case "gp_axislhl": return _gp_axislhl_released; break;
				case "gp_axislhr": return _gp_axislhr_released; break;
				case "gp_axislvu": return _gp_axislvu_released; break;
				case "gp_axislvd": return _gp_axislvd_released; break;
				case "gp_axisrhl": return _gp_axisrhl_released; break;
				case "gp_axisrhr": return _gp_axisrhr_released; break;
				case "gp_axisrvu": return _gp_axisrvu_released; break;
				case "gp_axisrvd": return _gp_axisrvd_released; break;
				default: return 0;
			}
		}else {
			return 0;	
		}
		
	}else if (_input_type = "none") {
		return 0;	
	}
}