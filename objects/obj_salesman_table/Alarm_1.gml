/// @description Insert description here
// You can write your code in this editor
if table_num != global.salesman_spawn_area and room = room_proc_gen_test {
	instance_destroy();	
}else {
	instance_create_depth(x+64,y-64,depth-1,obj_salesman);
}