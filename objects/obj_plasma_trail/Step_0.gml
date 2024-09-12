x += hspd;
y += vspd;
if alarm_is_set = false {
	alarm[1] = 6;
	if type = 1 {
		randomize();
		alarm[0] = irandom_range(10,15);
	}else if type = 2 {
		randomize();
		alarm[0] = irandom_range(15,30);
		alarm[1] = 6;
	}
	alarm_is_set = true;
}
random_set_seed(global.seed);