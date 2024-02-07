// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Keyboard_Get_Action(button,action_type){
	//key = the specific key/mouse button
	//action_type = the type of action to return ("check", "pressed", "released")
	
	var _input_type = "none";
	
	if (button = mb_left or button = mb_middle or button = mb_right or button = mb_side1 or button = mb_side2) {
		_input_type = "mouse";
	}else if (button != -1) {
		_input_type = "keyboard";
	}else if (button = -1) {
		_input_type = "none";
	}
	
	if (_input_type = "mouse") {  //mouse buttons
		if action_type = "check" {
			return mouse_check_button(button);
		}else if action_type = "pressed" {
			return mouse_check_button_pressed(button);
		}else if action_type = "released" {
			return mouse_check_button_released(button);
		}else {
			return 0;
		}
	}else if (_input_type = "keyboard") { //keyboard keys
		if action_type = "check" {
			return keyboard_check(button);
		}else if action_type = "pressed" {
			return keyboard_check_pressed(button);
		}else if action_type = "released" {
			return keyboard_check_released(button);
		}else {
			return 0;
		}
	}else if (_input_type = "none") {
		return 0;	
	}
}