
// Inherit the parent event
event_inherited();
depth = -7;

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

drop_coins= false;
