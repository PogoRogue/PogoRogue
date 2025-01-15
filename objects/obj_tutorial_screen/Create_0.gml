depth = -10;

camera_object = obj_camera;
cam = view_camera[0];
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

x = view_w_half;
y = camera_object.y - (view_h_half + sprite_height + 64);

y_add = 0; //bob this amount of pixels
y_add_spd_start = 0.3; 
y_add_spd = y_add_spd_start; //bob at this spee
y_up = false; //bobbing up or down
init_x = x;
init_y = y;
end_x = 496;
end_y = 5248;
timer = 0;

spd = 0;
still = true;

propeller_sound = audio_play_sound(snd_slotmachine_propeller,0,true);
audio_sound_gain(propeller_sound, 0, 0);
audio_sound_gain(propeller_sound, 1, 750);

animation_frame = 0;

changesprite = false;
changesprite_close = true;
changesprite_frame = 0;

next_sprite = spr_tutorial_shoot;