/// Instantiate variables

grid_follow = mp_grid_create(0,0,room_width/16,room_height/16,16,16);
mp_grid_add_instances(grid_follow,obj_ground_parent,false);
depth = -30000;
