
// Inherit the parent event
event_inherited();
target_x = obj_player.x;
target_y = obj_player.y;

//grid_follow = mp_grid_create(0,0,room_width/16,room_height/16,16,16);

follow_path = path_add();

//mp_grid_add_instances(grid_follow,obj_ground_parent,false);

alarm[1]=1;