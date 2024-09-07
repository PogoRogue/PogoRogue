if room != room_tutorial and room != room_starting_area {
	randomize();
	image_index = choose(0,1);
	random_set_seed(global.seed);
}