// @description Damage enemy

if(!other.is_dead && !other.invinsible && other.explosion_defense > 0) {
	other.hp -= damage * other.explosion_defense;
	other.red_frames = 10;
}