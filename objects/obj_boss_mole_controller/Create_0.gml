view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);
top_border = view_height - 20;
mole_defeated = false;

instance_create_depth(x, y, -20, obj_boss_mole_health);


mole_1 = instance_create_depth(0,0,501,obj_boss_mole1);
mole_2 = instance_create_depth(0,0,501,obj_boss_mole2);
mole_3 = instance_create_depth(0,0,501,obj_boss_mole3);

alarm[0] = 1;