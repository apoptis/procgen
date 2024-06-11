/// @desc draw mouse to GUI

window_set_cursor(cr_none);

draw_sprite_ext(sprite_index,image_index,mx,my,size,size,0,c_white,1);

if instance_exists(pLevel) {
	var _terr = -1;
	_terr = procgen_get_terrain(pLevel.levelGrid, x div TILE_SIZE, y div TILE_SIZE);
	
	draw_set_color(c_dkgray);
	draw_set_alpha(.3);
	draw_rectangle(mx,my, mx+20,my+20, false);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(mx+10,my+12,_terr);
}