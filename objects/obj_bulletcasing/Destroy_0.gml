/// @description chance of exploding

if global.hot_shells = true {
	if exploded = true {
		with instance_create_depth(x,y,depth,obj_projectile_explosion) {
			damage = 16;
		}
	}
}