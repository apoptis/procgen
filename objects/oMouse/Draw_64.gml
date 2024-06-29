/// @desc draw mouse to GUI

//cursor override
window_set_cursor(cr_none);
draw_sprite_ext(sprite_index,image_index,mx,my,size,size,0,c_white,1);

if instance_exists(pLevel) && x >= 0 && y >= 0 && x < RESOLUTION_W*TILE_SIZE && y < RESOLUTION_H*TILE_SIZE {
	var _terr = 0;
	var _x = x div TILE_SIZE;
	var _y = y div TILE_SIZE;
	_terr = procgen_get_terrain(pLevel.levelArr, _x, _y);
	
	draw_set_color(c_dkgray);
	draw_set_alpha(.3);
	draw_rectangle(mx,my, mx+20,my+20, false);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(mx+10,my+12,_terr);
	
	draw_set_halign(fa_right);
	draw_text(mx-10,my-20, "x: " + string(_x));
	draw_text(mx-10,my-8, "y: " + string(_y));
	
	if mouse_check_button(mb_left)
		draw_text(mx-10,my-32, "autotile: " + string(procgen_autotile(pLevel.levelArr, _x, _y)));
}