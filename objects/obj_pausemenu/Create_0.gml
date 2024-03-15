if instance_number(obj_pausemenu) > 1 {
	instance_destroy();
}

select = 1;
selected = false;
num_of_options = 5;
usable = true;
alarm2_time = 30;
alarm3_time = 30;

instance_deactivate_object(self);