/// @description Instantiate variables

hole_position_1 = {x: x - 41, y: y - 14}; // Top left
hole_position_2 = {x: x + 41, y: y - 14}; // Top right
hole_position_3 = {x: x, y: y + 32}; // Bottom center

vole_is_dead = false;
vole_hp = 40;
current_position = hole_position_1;

spawn_count = 0; // for generating random positions

// Start spawning vole
alarm_set(0, room_speed);

depth = 202;
