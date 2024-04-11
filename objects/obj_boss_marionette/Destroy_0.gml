/// @description Create coins

/* commented this out since we probably don't need coins to spawn
with instance_create_depth(x, y, depth-1, obj_coin_spawner) {
	num_of_coins = 300;
}*/

// Inherit the parent event
event_inherited();

instance_destroy(obj_boss_gate_close);
instance_destroy(obj_boss_marionette_health);


//win screen
if !instance_exists(obj_deathscreen) {
	with instance_create_depth(x,y,depth-1000,obj_deathscreen) {
		win = true;	
		global.num_of_wins += 1;
		scr_Save_Real("num_of_wins",global.num_of_wins);
	}
}