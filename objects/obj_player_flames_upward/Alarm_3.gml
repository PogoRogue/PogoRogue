/// @description create particle
if image_alpha > 0.4 {
	alarm[3] = particle_spawn_gap;
	randomize();
	scr_Create_Flames();
	random_set_seed(global.seed);
}