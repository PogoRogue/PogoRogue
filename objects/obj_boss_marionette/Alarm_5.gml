/// @description Bullet Burst activation
// You can write your code in this editor
    var _burst=instance_create_layer(x, y, "Instances", obj_pattern_template);
	if(phase==2){
		_burst.rand=true;
	}
	_burst.spread=360;
    _burst.repeats=3;
    _burst.amount=18;
	
    special_action="NO";