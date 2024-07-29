fade_out = false;
destroy_time = 300;
destroy_time_live = destroy_time * global.bar_time_added;
//alarm[0] = destroy_time;
audio_play_sound(snd_shieldBubble,0,false);
image_speed = 0;
arrows_alpha = 2;
decrease_arrows_alpha = false;
bouncing = false;
obj_player.shieldbubble_obj = self;
bounce_x = x;
bounce_y = y;

bouncing_bottom = false;
bouncing_left = false;
bouncing_top = false;
bouncing_right = false;

prev_hspd = 0;
prev_vspd = 0;
bounced = false;
bounced_cancel = false;

not_colliding = false;

instance_create_depth(x,y,depth,obj_shieldbubble_mask);
instance_create_depth(x,y,depth,obj_shieldbubble_mask2);