/// @description Follow parent

if(!instance_exists(parent)) {
	exit;	
}

x = parent.x;
y = parent.y;

if(!is_active) {
	image_alpha *= 0.9;
} else {
	image_alpha = min(image_alpha + 0.05, 1.0);
}

if !audio_is_playing(snd_shieldBubble_enemy) and is_active {
	audio_sound_loop_start(snd_shieldBubble_enemy,0.5);
}