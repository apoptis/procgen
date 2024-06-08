/// @desc draw button
draw_set_alpha(.7);

if instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	draw_set_alpha(1);
	if mouse_check_button_released(mb_left) onClick();
}

draw_self();

draw_set_font(fntONE);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x+sprite_width/2,y+sprite_height/2+1,text);
draw_set_alpha(1);