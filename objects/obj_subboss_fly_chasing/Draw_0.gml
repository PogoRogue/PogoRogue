/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 





// Inherit the parent event
event_inherited();


//draw_self();
//draw_path(follow_path,x,y,1);

if sprite_index = spr_B1_Fly_Drop {
	draw_sprite_ext(spr_B1_Fly_Drop_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,red_alpha);
}else if sprite_index = spr_B1_Fly_Move {
	draw_sprite_ext(spr_B1_Fly_Move_red,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,red_alpha);
}