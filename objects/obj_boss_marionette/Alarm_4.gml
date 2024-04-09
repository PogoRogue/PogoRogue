/// @description Shield
// You can write your code in this editor
var _shield = instance_create_layer(x, y, "Instances", obj_shield_plus);
_shield.parent=self;
_shield.depth=depth+1;
if(phase==2){
    _shield.restore_duration=room_speed;
	_shield.lifetime=10*room_speed;
}