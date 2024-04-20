/// @description Instantiate variables

parent = instance_nearest(x, y, obj_boss_marionette);
target = instance_nearest(x, y, obj_player);

// Joints
forearm = instance_create_depth(x, y, depth - 5, obj_boss_marionette_forearm, {arm_num: arm_num, length_diff: 32});

forearm.parent = self;
