/// @description Update segment count

if(!instance_exists(obj_boss_basketball)) {
	instance_destroy(self);
	exit;
}

current_health = (global.basketball_health + global.soccer_health1 + global.soccer_health2 +
global.volleyball_health1 + global.volleyball_health2 + global.volleyball_health3 + global.volleyball_health4 +
global.tennis_health1 + global.tennis_health2 + global.tennis_health3 + global.tennis_health4 + 
global.tennis_health5 + global.tennis_health6 + global.tennis_health7 + global.tennis_health8);

num_segments = floor((current_health / global.max_ball_health) * total_spaces);