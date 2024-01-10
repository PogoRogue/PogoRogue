// Inherit the parent event
event_inherited();

if instance_exists(obj_player) and room != room_shop {
	if weapon = obj_player.gun_1 or weapon = obj_player.gun_2 or weapon = obj_player.gun_3 {
		instance_destroy();
	}
}