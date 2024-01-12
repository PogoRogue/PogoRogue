// @description Damage enemy

if(!other.is_dead) {
	other.hp -= damage;
	other.red_frames = 10;
}