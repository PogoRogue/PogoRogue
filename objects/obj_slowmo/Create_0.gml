slow_time = true; //actively slow down time while this is active
speedup_time = false; //actively speed up time while this is active
slow_mo_speed = 40; //frames per second we want the slow mo to be
time = 600 * global.bar_time_added; //how many frames we want the slow mo to last
time_left = 600 * global.bar_time_added;
if hacker = true {
	time = 400 * global.bar_time_added; //how many frames we want the slow mo to last
	time_left = 400 * global.bar_time_added;
}
init_room_speed = room_speed; //initial room speed
back_frames = 0;
front_frames = 0;
gear_angle = 0;
depth += 200;
