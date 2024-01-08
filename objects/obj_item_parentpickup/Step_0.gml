// Inherit the parent event
event_inherited();

if instance_exists(obj_player) and room != room_shop {
	if pickup = obj_player.pickup_1 or pickup = obj_player.pickup_2 {
		instance_destroy();
	}
}