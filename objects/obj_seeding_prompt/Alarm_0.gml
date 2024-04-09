/// @description Destroy
//instance_destroy();
if instance_exists(obj_pausemenu) {

}else {
	with obj_pause {
		item_swap = false;
		paused_outside = true;
	}
}