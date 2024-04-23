/// }@description Instantiate variables

boss = instance_nearest(x, y, obj_boss_marionette);
parent = instance_nearest(x, y, obj_boss_marionette_thigh);
target = instance_nearest(x, y, obj_player);

initial_depth = depth;

wire_color = leg_num == 1 ? #4b80ca : #ff0546;