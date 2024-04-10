/// @description Instantiate variables

parent = instance_nearest(x, y, obj_boss_marionette);
target = instance_nearest(x, y, obj_player);

// Create forearm
forearm = instance_create_depth(x, y, depth - 1, obj_boss_marionette_forearm, {length_diff: 32});
forearm.parent = self;
