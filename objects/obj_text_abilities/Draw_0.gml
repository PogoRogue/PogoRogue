/// @description Draw strings by column

draw_set_halign(fa_center);
draw_set_font(fnt_tutorial);

// Draw left column
scr_Draw_Text_Outlined(x, y, height_text, c_white);

draw_sprite_ext(spr_button_d_large,0,x-32,y,1,1,0,c_white,1);