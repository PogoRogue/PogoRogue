//y -= 1;
if image_xscale > 1 {
	image_xscale -= 0.1;
}else if image_xscale > 0 {
	image_xscale -= 0.05;
}else {
	image_xscale = 0;
}
if image_yscale > 1 {
	image_yscale -= 0.1;
}else if image_yscale > 0 {
	image_yscale -= 0.05;
}else {
	image_yscale = 0;
}

image_alpha = image_xscale;