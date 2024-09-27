
depth = 10;

is_despawning = false;
is_touching_player = false;
wobble = 0.0;
stretch = 0.0;
drop_coins = false;
rotation = 0;
diminished_player_jump = -3;
initial_player_jump = obj_player.vsp_basicjump;

if room != room_boss_2 {
	alarm_set(0, 12 * room_speed); // Despawn after 15 seconds
}else {
	alarm_set(0, 100 * room_speed); // Despawn after 15 seconds
}

//depth = obj_player.depth - 10;