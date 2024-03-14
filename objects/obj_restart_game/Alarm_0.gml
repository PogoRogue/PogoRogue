room_persistent = false;
global.phase = 1;
global.tileset = tl_ground;
instance_deactivate_all(false);
audio_play_sound(snd_selectOption,0,false);
room_restart();
instance_destroy();