function scr_Draw_Text_Outlined_Transformed(xx,yy,str,color,xscale,yscale,angle,alpha){
	xx = argument[0];  
	yy = argument[1];  
	
	draw_set_alpha(alpha);
  
	draw_set_color(make_color_rgb(33,33,35));  
	draw_text_transformed(xx+1, yy+1, argument[2],argument[4],argument[5],argument[6]);  
	draw_text_transformed(xx-1, yy-1, argument[2],argument[4],argument[5],argument[6]);  
	draw_text_transformed(xx,   yy+1, argument[2],argument[4],argument[5],argument[6]);
	draw_text_transformed(xx+1,   yy, argument[2],argument[4],argument[5],argument[6]);
	draw_text_transformed(xx,   yy-1, argument[2],argument[4],argument[5],argument[6]);
	draw_text_transformed(xx-1,   yy, argument[2],argument[4],argument[5],argument[6]);  
	draw_text_transformed(xx-1, yy+1, argument[2],argument[4],argument[5],argument[6]);
	draw_text_transformed(xx+1, yy-1, argument[2],argument[4],argument[5],argument[6]);  
  
	draw_set_color(color);
	//set white to the white in the color pallette
	if (color = c_white) {
		draw_set_color(make_color_rgb(242,240,229));
	}
	draw_text_transformed(xx,yy,argument[2],argument[4],argument[5],argument[6]);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
}