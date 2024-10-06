/// @desc scr_Screen_Shake(magnitude,frames,vibrate_controller);
///@arg Magnitude sets the strength of the shake (distance range)
///@arg Frames sets the length of the shake in frames (60 = 1 second)
function scr_Screen_Shake(magnitude, frames, vibrate_controller) {
	var screenshake_zero = (global.screenshake != 0);
	var controller_vibration_zero = (global.controller_vibration != 0);
	var screenshake = (global.screenshake+25)/80*screenshake_zero;
	var controller_vibration = (global.controller_vibration+25)/80*controller_vibration_zero;
	
	if instance_exists(obj_player) {
		if obj_player.dead = false {
			with (obj_camera) {
				if (magnitude * screenshake > shake_remain) {
					shake_magnitude = magnitude * screenshake;
					shake_remain = magnitude * screenshake;
					shake_length = frames * screenshake;
			
				}
		
				if (magnitude * controller_vibration > shake_remain_controller) and (vibrate_controller = true) {
					shake_magnitude_controller = magnitude * controller_vibration;
					shake_remain_controller = magnitude * controller_vibration;
					shake_length_controller = frames * controller_vibration;
					controller_vibrate = controller_vibration;
				}
			}
		}
	}else {
		//duplicate code
		with (obj_camera) {
			if (magnitude * screenshake > shake_remain) {
				shake_magnitude = magnitude * screenshake;
				shake_remain = magnitude * screenshake;
				shake_length = frames * screenshake;
			
			}
		
			if (magnitude * controller_vibration > shake_remain_controller) and (vibrate_controller = true) {
				shake_magnitude_controller = magnitude * controller_vibration;
				shake_remain_controller = magnitude * controller_vibration;
				shake_length_controller = frames * controller_vibration;
				controller_vibrate = controller_vibration;
			}
		}
	}
}