// Update red shader frames
red_frames = max(red_frames - 1, 0);

hp = 100;

//update center position
center_x_sprite = bbox_left + ((bbox_right - bbox_left)/2);
center_y_sprite = bbox_top + ((bbox_bottom - bbox_top)/2);