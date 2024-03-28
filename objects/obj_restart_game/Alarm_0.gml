room_persistent = false;
global.phase = 1;
global.tileset = tl_ground;
audio_play_sound(snd_selectOption,0,false);
scr_Room_Restart(true);
instance_destroy();