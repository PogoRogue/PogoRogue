/// @description Instantiate variables

// Inherit the parent event
event_inherited();

// Instantiate additional variables
depth = 5;
spd = 2.5;
at_edge = false;
at_wall = false;
explosion_defense = 0.0;
mine_delay = room_speed * 2;
alarm_set(1, mine_delay);
