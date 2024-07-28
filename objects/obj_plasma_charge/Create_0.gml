plasma_object = noone;
obj_player.sprite_index = obj_player.player_sprite;
obj_player.image_index = 0;

charge = 0;
charge_max = 10;
frames_to_charge = 80;
orb_rotation = 0;
orb_sprite = spr_projectile_plasma1;
orb_glow_sprite = spr_plasma_outline1;
orb_speed = 0;
orb_scale = 1;
trail_sprite = spr_plasma_trail1;
trail_spawnrate = 5;
damage = 1;
obj_player.state = obj_player.state_plasmacharge;
obj_player.plasma_gun.current_bullets += 1;

audio_play_sound(snd_javelin_charge,0,false);