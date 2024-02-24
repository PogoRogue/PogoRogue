/// @description Bounce off walls


if(boss.object_index == obj_boss_sphere) {
	var i = 1;
	while(true) {
		if(!place_meeting(x + i, y, obj_ground)) {
			boss.x += 3 * i;
			boss.hspeed *= -1;
			break;
		}
		if(!place_meeting(x - i, y, obj_ground)) {
			boss.x -= 3 * i;
			boss.hspeed *= -1;
			break;
		}
		if(!place_meeting(x, y + i, obj_ground)) {
			boss.y += 3 * i;
			boss.vspeed *= -1;
			break;
		}
		if(!place_meeting(x, y - i, obj_ground)) {
			boss.y -= 3 * i;
			boss.vspeed *= -1;
			break;	
		}
		i++;
	}
}
