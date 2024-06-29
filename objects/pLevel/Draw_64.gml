/// @desc draw level info

draw_set_halign(fa_center);

//drop shadow
draw_set_color(c_black);
draw_text(RESOLUTION_W/2+1, 31, text);

//main level text
draw_set_color(c_white);
draw_text(RESOLUTION_W/2, 30, text);