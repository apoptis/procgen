/// @desc draw level

// OLD WAY (expensive)
/*
var _cell_x = 0;
repeat(width) {
	var _cell_y = 0;
	repeat(height) {
		draw_set_color(procgen_get_color(levelGrid,_cell_x,_cell_y));
		draw_rectangle(_cell_x, _cell_y, _cell_x+1, _cell_y+1, false);
		draw_set_color(c_white);
		_cell_y++;
	}
	_cell_x++;
}*/