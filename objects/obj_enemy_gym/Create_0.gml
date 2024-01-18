/// @description Create Enemy List
// You can write your code in this editor
enemy_list = ds_list_create();
index=0;

//insert all enemies here
ds_list_add(enemy_list, obj_enemy_explode_walking);
ds_list_add(enemy_list, obj_enemy_flying);
ds_list_add(enemy_list, obj_enemy_moving);
ds_list_add(enemy_list, obj_enemy_moving_jumping);
ds_list_add(enemy_list, obj_enemy_shoot_only_jumping);
ds_list_add(enemy_list, obj_enemy_shooter_moving);
ds_list_add(enemy_list, obj_enemy_stomp_only_moving);
ds_list_add(enemy_list, obj_enemy_turret);
ds_list_add(enemy_list, obj_enemy_turret_mobile);
//end

obj=ds_list_find_value(enemy_list, index);
instance_create_layer(x, y, "Instances", obj);