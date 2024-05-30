/// @description Drop mine

if(!is_dead) {
	instance_create_depth(x, y , depth + 1, obj_enemy_car_mine);
	alarm_set(1, mine_delay);
}
