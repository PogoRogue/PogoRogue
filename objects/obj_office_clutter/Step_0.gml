if collided = true {
	vspeed += 0.15;
	if abs(speed) > 0.5 and rotate = true {
		angle += speed;
	}

	if place_meeting(x+hspeed,y,obj_ground) and bounced = false {
		while !place_meeting(x+sign(hspeed),y,obj_ground) {
			x += sign(hspeed);
		}
		hspeed = 0;
	}

	if place_meeting(x,y+vspeed,obj_ground) and bounced = false and !place_meeting(x,y+vspeed,obj_office_table) {
		while !place_meeting(x,y+sign(vspeed),obj_ground) {
			y += sign(vspeed);
		}
		if abs(vspeed) <= 0.1 {
			collided = false;
		}
		hspeed = 0;
		vspeed = 0;
		rotate = false;
	}
	
	hspeed *= 0.99;
	
}else {
	vspeed += 0.15;
	if place_meeting(x,y+vspeed,obj_ground_parent) {
		while !place_meeting(x,y+sign(vspeed),obj_ground_parent) {
			y += sign(vspeed);
		}
		vspeed = 0;
	}
	if place_meeting(x,y+vspeed,obj_office_clutter) {
		while !place_meeting(x,y+sign(vspeed),obj_office_clutter) {
			y += sign(vspeed);
		}
		vspeed = 0;
	}
}

if place_meeting(x,y,obj_player) and collided = false {
	randomize();
	if instance_place(x,y,obj_player).x > x {
		hspeed =  random_range(-8,-2);
	}else {
		hspeed = random_range(2,8);
	}
	vspeed = random_range(-abs(hspeed),-2);
	random_set_seed(global.seed);
	collided = true;
}

if place_meeting(x,y,obj_player_mask) and collided = false {
	randomize();
	if instance_place(x,y,obj_player_mask).x > x {
		hspeed =  random_range(-8,-2);
	}else {
		hspeed = random_range(2,8);
	}
	vspeed = random_range(-abs(hspeed),-2);
	random_set_seed(global.seed);
	collided = true;
}

if place_meeting(x,y,obj_projectile) and collided = false {
	randomize();
	if instance_place(x,y,obj_projectile).x > x {
		hspeed =  random_range(-8,-2);
	}else {
		hspeed = random_range(2,8);
	}
	vspeed = random_range(-abs(hspeed),-2);
	random_set_seed(global.seed);
	collided = true;
}