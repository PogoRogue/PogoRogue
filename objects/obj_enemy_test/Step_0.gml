/// @description Movement and death state
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//death
if (hp <= 0) {
	instance_destroy();
	if (created_items = false) {
		Create_Item_Drops(random_items);
		created_items = true;
	}
}

is_grounded = instance_place(x, y, [obj_ground_parent]);
if (is_grounded <= 0) {
	vspeed = 3;
	is_falling = instance_place(x, y+vspeed, [obj_ground_parent]);
	if (is_falling > 0) {
		vspeed=0;
	}
}

