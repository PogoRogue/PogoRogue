/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 


//show_message("1");
if instance_exists(worm) {
	worm.depth = 99;
	selected_hole = irandom_range(1,3);


	if(selected_hole == 1){
		worm.x = hole1x;
		worm.y = hole1y;
		worm.sprite_index = spr_enemy_walking_explosion;
	
	}
	else if(selected_hole == 2){
		worm.x = hole2x;
		worm.y = hole2y;
		worm.sprite_index = spr_enemy_walking_explosion;
	}
	else if(selected_hole == 3){
		worm.x = hole3x;
		worm.y = hole3y;
		worm.sprite_index = spr_enemy_walking_explosion;
	}
}

