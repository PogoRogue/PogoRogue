/// @description move towards player

if room != room_shop {
	if salesman = false and pogosmith = false {
		follow_object = obj_player;
		follow_object2 = obj_player_mask;
	}else if salesman = true {
		follow_object = obj_salesman;
		follow_object2 = obj_salesman;
	}else if pogosmith = true {
		follow_object = obj_pogosmith;
		follow_object2 = obj_pogosmith;
	}
}else {
	follow_object = obj_shopkeeper;	
	follow_object2 = obj_shopkeeper;
}

if obj_player.state != obj_player.state_blink and obj_player.state != obj_player.state_strike or salesman = true or pogosmith = true {
	if (instance_exists(follow_object)) {
		move_towards_point(follow_object.x,follow_object.y,spd);
		spd = lerp(spd,max_spd,0.05);
	}
}else {
	speed = 0;
	spd = 0;
}	

//destroy on contact
if (instance_exists(follow_object) and instance_exists(follow_object2)) {
	if place_meeting(x+hspeed,y+vspeed,follow_object) or place_meeting(x+hspeed,y+vspeed,follow_object2) {
		instance_destroy();
	}
}

if !place_meeting(x,y,obj_enemy_parent) {
	colliding_with_enemies = false;
}