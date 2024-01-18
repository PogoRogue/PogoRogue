/// @description Clear&Swap the Enemy
// You can write your code in this editor
instance_destroy(obj)
index++;
if(index>=ds_list_size(enemy_list)){
	index=0;
}
obj=ds_list_find_value(enemy_list, index);
instance_create_layer(x, y, "Instances", obj);

