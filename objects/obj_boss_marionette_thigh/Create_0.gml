/// @description Instantiate variables

parent = instance_nearest(x, y, obj_boss_marionette);
target = instance_nearest(x, y, obj_player);

// Joints
leg = instance_create_depth(x, y, depth - 5, obj_boss_marionette_leg, {leg_num: leg_num, length_diff: 32});

leg.parent = self;
initial_depth = depth;
