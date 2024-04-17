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
