/// @description Draw self
draw_self();

if locked = true {
	draw_sprite(spr_lockicon,0,x,bbox_top-16);
}

if lock_unlocked = true {
	locked = false;
	var distance = 62;
	
	if lock_unlocked_frames < sprite_get_number(spr_lockicon_unlocked)-1 {
		lock_unlocked_frames += 0.5;
	}else if lock_alpha > 0 {
		if lock_alpha >= 1 {
			audio_play_sound(snd_zap,0,false);
		}
		lock_alpha -= 0.1;
	}else {
		lock_unlocked = false;
		locked = false;
	}
	
	//sprite
	if image_xscale = 1 {
		draw_sprite_ext(spr_lockicon_unlocked,lock_unlocked_frames,x,bbox_top-16,1,1,0,c_white,lock_alpha);	
	}else {
		draw_sprite_ext(spr_lockicon_unlocked,lock_unlocked_frames,x,bbox_top-16,1,1,0,c_white,lock_alpha);	
	}
}else {
	lock_unlocked_frames = 0;
}