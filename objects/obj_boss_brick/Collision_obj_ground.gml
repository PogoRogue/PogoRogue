/// @description Bounce off walls


if(boss.object_index == obj_boss_sphere) {
	var i = 1;
	while(true) {
		if(!place_meeting(x + i, y, obj_ground)) {
			boss.x += 4 * i;
			boss.hspeed *= -1;
			scr_Screen_Shake(6,8,false);
			audio_play_sound(snd_boss1_slam,0,false);
			break;
		}
		if(!place_meeting(x - i, y, obj_ground)) {
			boss.x -= 4 * i;
			boss.hspeed *= -1;
			scr_Screen_Shake(6,8,false);
			audio_play_sound(snd_boss1_slam,0,false);
			break;
		}
		if(!place_meeting(x, y + i, obj_ground)) {
			boss.y += 4 * i;
			boss.vspeed *= -1;
			scr_Screen_Shake(6,8,false);
			audio_play_sound(snd_boss1_slam,0,false);
			break;
		}
		if(!place_meeting(x, y - i, obj_ground)) {
			boss.y -= 4 * i;
			boss.vspeed *= -1;
			scr_Screen_Shake(6,8,false);
			audio_play_sound(snd_boss1_slam,0,false);
			break;	
		}
		i++;
	}
}
