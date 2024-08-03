/// @desc draw override

//draw tile highlight
var _tile_x = x div TILE_SIZE * TILE_SIZE;
var _tile_y = y div TILE_SIZE * TILE_SIZE;
var _tile_size = TILE_SIZE-1;
draw_rectangle(_tile_x, _tile_y, _tile_x+_tile_size, _tile_y+_tile_size, true);