
depth = 10;

is_despawning = false;
is_touching_player = false;
wobble = 0.0;
stretch = 0.0;
drop_coins = false;
rotation = 0;
diminished_player_jump = -3;
initial_player_jump = obj_player.vsp_basicjump;

alarm_set(0, 15 * room_speed); // Despawn after 15 seconds