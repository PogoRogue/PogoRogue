randomize();

room_started = false;
// Our prebuilt rooms and their dimensions
// Room format: [width, height, room_id]
prebuilt_rooms = ds_list_create();
ds_list_add(prebuilt_rooms, [3, 3, "T"]); //First room in list is starting room T for tutorial
ds_list_add(prebuilt_rooms, [1, 1, "Sh"]); //Second room in list is shop room Sh for shop
ds_list_add(prebuilt_rooms, [1, 1, "B"]); //Third room in list is boss entry room B for boss
ds_list_add(prebuilt_rooms, [2, 2, "c2"]); //3x3 Combat room, c stands for combat
ds_list_add(prebuilt_rooms, [3, 3, "c3"]); //2x2 Combat room

rooms_to_generate = 2;
max_gen_width = 15;

global.debug_wall_count = 0;

var generate_start_room = false;
var generate_boss_room = false;

var height_val = 8; //Default 8. Puts X/4 height between first combat room and shop room, and
//then X between shop and last room
var width_val = 9; //Default 9. Puts X width to the right of first room, and X/2 to the left of second



layout_grid = scr_Generate_Sprite_Test_Layout(prebuilt_rooms, generate_start_room, generate_boss_room, width_val, height_val);

//tiling layer
global.ground_layer = layer_create(-1);
global.tilemap_ground = layer_tilemap_create(global.ground_layer,-20000,-20000,tl_ground,20000,20000);


conduct_location_analysis = true;
