/// @description Instantiate variables

depth = -10;

grav = 0.2;

is_despawning = false;
is_touching_player = false;

wobble = 0.0;
stretch = 0.0;

alarm_set(0, 45 * room_speed); // Despawn after 60 seconds

drop_coins = false;

diminished_player_jump = -3;
initial_player_jump = obj_player.vsp_basicjump;