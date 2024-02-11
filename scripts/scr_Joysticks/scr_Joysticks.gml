// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Joysticks(left_lr,left_ud,right_lr,right_ud,action_type,button) {

	_gp_axislhl = gamepad_axis_value(0,gp_axislh) < -0.5;
	_gp_axislhr = gamepad_axis_value(0,gp_axislh) > 0.5;
	_gp_axislvu = gamepad_axis_value(0,gp_axislv) < -0.5;
	_gp_axislvd = gamepad_axis_value(0,gp_axislv) > 0.5;
	_gp_axisrhl = gamepad_axis_value(0,gp_axisrh) < -0.5;
	_gp_axisrhr = gamepad_axis_value(0,gp_axisrh) > 0.5;
	_gp_axisrvu = gamepad_axis_value(0,gp_axisrv) < -0.5;
	_gp_axisrvd = gamepad_axis_value(0,gp_axisrv) > 0.5;
	
	_gp_axislhl_pressed = false;
	_gp_axislhr_pressed = false;
	_gp_axislvu_pressed = false;
	_gp_axislvd_pressed = false;
	_gp_axisrhl_pressed = false;
	_gp_axisrhr_pressed = false;
	_gp_axisrvu_pressed = false;
	_gp_axisrvd_pressed = false;
	
	_gp_axislhl_released = !_gp_axislhl;
	_gp_axislhr_released = !_gp_axislhr;
	_gp_axislvu_released = !_gp_axislvu;
	_gp_axislvd_released = !_gp_axislvd;
	_gp_axisrhl_released = !_gp_axisrhl;
	_gp_axisrhr_released = !_gp_axisrhr;
	_gp_axisrvu_released = !_gp_axisrvu;
	_gp_axisrvd_released = !_gp_axisrvd;
	
	if action_type = "pressed" {
	
		//left joystick horizontal
		if (obj_controls_controller.joystick_left_lr) {
			_gp_axislhl_pressed = false;
			_gp_axislhr_pressed = false;
		}else if (_gp_axislhr) and button = -10001 {
			_gp_axislhr_pressed = true;
		    with obj_controls_controller {
				joystick_left_lr  = true;
		    }
		} else if (_gp_axislhl) and button = -10000 {
		   _gp_axislhl_pressed = true;
		    with obj_controls_controller {
				joystick_left_lr  = true;
		    }
		}
	
		if (!_gp_axislhr) and (!_gp_axislhl) {
			with obj_controls_controller {
				joystick_left_lr = false;
		    }
		}

		//left joystick vertical
		if (obj_controls_controller.joystick_left_ud) {
			_gp_axislvu_pressed = false;
			_gp_axislvd_pressed = false;
		}else if (_gp_axislvd) and button = -10003 {
		    _gp_axislvd_pressed = true;
		    with obj_controls_controller {
				joystick_left_ud  = true;
		    }
		} else if (_gp_axislvu) and button = -10002 {
		    _gp_axislvu_pressed = true;
		    with obj_controls_controller {
				joystick_left_ud  = true;
		    }
		}
	
		if (!_gp_axislvd) and (!_gp_axislvu) {
			with obj_controls_controller {
				joystick_left_ud  = false;
		    }
		}
	
		//right joystick horizontal
		if (obj_controls_controller.joystick_right_lr) {
			_gp_axisrhl_pressed = false;
			_gp_axisrhr_pressed = false;
		}else if (_gp_axisrhr) and button = -10005 {
		    _gp_axisrhr_pressed = true;
		    with obj_controls_controller {
				joystick_right_lr  = true;
		    }
		} else if (_gp_axisrhl) and button = -10004 {
		    _gp_axisrhl_pressed = true;
		    with obj_controls_controller {
				joystick_right_lr  = true;
		    }
		}
	
		if (!_gp_axisrhr) and (!_gp_axisrhl) {
			with obj_controls_controller {
				joystick_right_lr  = false;
		    }
		}

		//right joystick vertical
		if (obj_controls_controller.joystick_right_ud) {
			_gp_axisrvu_pressed = false;
			_gp_axisrvd_pressed = false;
		}else if (_gp_axisrvd) and button = -10007 {
		    _gp_axisrvd_pressed = true;
		    with obj_controls_controller {
				joystick_right_ud = true;
		    }
		} else if (_gp_axisrvu) and button = -10006 {
		    _gp_axisrvu_pressed = true;
		    with obj_controls_controller {
				joystick_right_ud = true;
		    }
		}
	
		if (!_gp_axisrvd) and (!_gp_axisrvu) {
			 with obj_controls_controller {
				joystick_right_ud  = false;
		     }
		}
	}
}