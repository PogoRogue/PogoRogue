/// @description Insert description here
// You can write your code in this editor

with instance_create_depth(self.x,self.y,50,obj_enemy_tutorial) {
	add_to_combo = other.init_add_to_combo;
	init_add_to_combo = other.init_add_to_combo;
}
instance_destroy(self)
