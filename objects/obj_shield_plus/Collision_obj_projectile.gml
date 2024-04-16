/// @description Deactivate shield

if other.destroy_on_impact = true {
	if(is_active) {
		is_active = false;
		instance_destroy(other);
		alarm_set(0, restore_duration);
		parent.current_iframes = 25;
	}
}
