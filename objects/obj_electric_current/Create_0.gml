/// @description Create Electric Floor
power_on = false;
on_time = 2;
off_time = 4;
powering_up_time = 1;
damage = 4;
is_active = true;
alarm[3] = room_speed * initial_delay;
sound = audio_play_sound(snd_nothing,0,false);