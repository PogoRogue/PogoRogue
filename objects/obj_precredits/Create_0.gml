instance_deactivate_all(true);
instance_activate_object(obj_steam);
instance_create_depth(x,y,depth,obj_fade_in);
instance_create_depth(x,y,depth,obj_mastercontroller);

alarm[0] = 120;

audio_group_stop_all(audiogroup_music);