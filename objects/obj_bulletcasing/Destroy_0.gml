/// @description chance of exploding
if global.hot_shells = true {
	if exploding_chance <= 5 or exploded = true {
		with instance_create_depth(x,y,depth,obj_projectile_explosion) {
			damage = 16;
		}
	}
}