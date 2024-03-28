/// @description Drop mine

if(!is_dead) {
	instance_create_layer(x, y , "enemies", obj_enemy_sweeper_mine );
	alarm_set(1, mine_delay);
}




