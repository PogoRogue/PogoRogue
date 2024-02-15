/// @description Instantiate variables

hole_position_1 = {x: x + 39, y: y + 50}; // Top left
hole_position_2 = {x: x + 121, y: y + 50}; // Top right
hole_position_3 = {x: x + 80, y: y + 96}; // Bottom center

vole_is_dead = false;
vole_hp = 24;
current_position = hole_position_1;

// Start spawning vole
alarm_set(0, room_speed);

depth = 10;
