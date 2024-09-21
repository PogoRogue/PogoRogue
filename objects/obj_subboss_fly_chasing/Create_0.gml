
// Inherit the parent event
event_inherited();
depth = -11;

// Select target
target_x = obj_player.x;
target_y = obj_player.y;

// Create pathway object if it doesn't exist
if(!instance_exists(obj_setup_pathway)) {
	instance_create_layer(0, 0, "enemies", obj_setup_pathway);
}


drop = false
//grid_follow = mp_grid_create(0,0,room_width/16,room_height/16,16,16);

//follow_path = path_add();

//mp_grid_add_instances(grid_follow,obj_ground_parent,false);

alarm[1]=1;

drop_coins = false;
created_items = true;

explode = false;
red_alpha = 0;

randomize();
max_spd = random_range(1.25,2.5);
random_set_seed(global.seed);