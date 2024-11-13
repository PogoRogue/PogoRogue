if instance_exists(obj_boss_basketball) {
	depth = obj_boss_basketball.depth - 20;
}
instance_create_depth(x,y,depth+99,obj_basketball_backboard);
instance_create_depth(x,y,depth-1,obj_basketball_hoop_large_mask_left);
instance_create_depth(x,y,depth-1,obj_basketball_hoop_large_mask_right);
instance_create_depth(x,y,depth-1,obj_basketball_make_large1);
instance_create_depth(x,y,depth-1,obj_basketball_make_large2);
instance_create_depth(x,y,depth-1,obj_basketball_make_large3);

random_set_seed(global.seed);
move_left = choose(true,false);