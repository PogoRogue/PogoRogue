// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Instance_Nearest_Notme(xx, yy, obj){
	var inst = noone;
	var distClosest = infinity;
	with (obj) {
	    var dist = point_distance(x, y, xx, yy);
	    if (id != other.id && dist < distClosest) {
	        inst = id;
	        distClosest = dist;
	    }
	}
	return inst;
}