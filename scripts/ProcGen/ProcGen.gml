/// @desc Procedural Generation Scripts

// tile binary
// mask: 0bCCCBBBBBBBBBBAAAAAAAAAA
// A : column
// B : row
// C : terrain type

///===================================///
//	TILE SCRIPTS
///===================================///

function procgen_set_cell(cell_x, cell_y, terrain_type) {
	var _tile = (cell_x << 0) + (cell_y << 10) + (terrain_type << 20);
	
	return _tile;
}


// get a tile's terrain type
function procgen_get_terrain(level_array, cell_x, cell_y) {
	
	if (cell_x < 0 or cell_y < 0) or (cell_x >= array_length(level_array) or cell_y >= array_length(level_array[0])) {
		return 0;
		exit;
	}
	
	var _cell = level_array[cell_x][cell_y];
	var _ter_mask = 0b111;
	var _terrain = _cell ? (_cell >> 20) : 0 & _ter_mask;
	
	return _terrain;
}


function procgen_get_color(level_array, cell_x, cell_y) {
	//useful if not using terrain types
	
	var _cell = level_array[cell_x][cell_y];
	var _ter_mask = 0b111;
	var _terrain = (_cell >> 20) & _ter_mask;
	var _color = c_white;
	
	switch (_terrain) {
		case 0 :
			_color = c_blue;
		break;
		
		case 1 :
			_color = c_aqua;
		break;
		
		case 2 :
			_color = c_yellow;
		break;
		
		case 3 :
			_color = c_lime;
		break;
		
		case 4 :
			_color = c_green;
		break;
		
		case 5 :
			_color = c_dkgray;
		break;
		
		default :
			_color = c_gray;
		break;
	}
	
	return _color;
}


/// Initialize level with default terrain
function procgen_init_level(width, height, def_terrain) {
	
	var _level_array = array_create(width);
	
	var _cell_x = 0;
	repeat(width) {
		var _cell_y = 0;
		repeat(height) {
			_level_array[_cell_x][_cell_y] = procgen_set_cell(_cell_x, _cell_y, def_terrain);
			_cell_y++;
		}
		_cell_x++;
	}
	
	
	show_debug_message("level initialised. default terrain: " + string(def_terrain));
	
	return _level_array;
}


///===================================///
//	PROCGEN CHANGE MAP FUNCTIONS
///===================================///

function procgen_make_rectangle(level_array, cell_x, cell_y, size_x, size_y, terrain) {
	var _cell_x = cell_x;
	repeat(size_x) {
		var _cell_y = cell_y;
		repeat(size_y) {
			level_array[_cell_x][_cell_y] = procgen_set_cell(_cell_x, _cell_y, terrain);
			_cell_y++;
		}
		_cell_x++;
	}
	
	return level_array;
}

function procgen_make_circle(level_array, center_x, center_y, radius, terrain) {
	// radius n±.5 almost always looks better for some reason
	radius = radius-.5;
	//set bounding edges
	var _top = ceil(center_y - radius);
	var _bot = floor(center_y + radius);
	var _left = ceil(center_x - radius);
	var _right = floor(center_x + radius);
	//2D for-loop to iterate thru bounding-box x, y
	for (var _j = _top; _j <= _bot; _j++) {
		for (var _i = _left; _i <= _right; _i++) {
			if procgen_inside_circle(_i, _j, center_x, center_y, radius) {
				level_array[_i][_j] = procgen_set_cell(_i, _j, terrain);
			}
		}
	}
	return level_array;
}


function procgen_inside_circle(tile_x, tile_y, center_x, center_y, radius) {
	//check if tile x,y is inside circle
	var _dx = center_x - tile_x;
	var _dy = center_y - tile_y;
	var _dist_sqrd = _dx*_dx + _dy*_dy;
	return _dist_sqrd <= radius*radius;
}


function procgen_make_path(start_x, start_y, end_x, end_y, noise_texture, level_array) {
	
	show_debug_message("path created");
}


function procgen_make_river(start_x, start_y, end_x, end_y, noise_texture, level_array) {
	
	show_debug_message("river created");
}

function procgen_minimum_array(level_array1, level_array2) {
	var _new_level_array;
	for (var _col = 0; _col < array_length(level_array1); _col++) {
		for (var _row = 0; _row < array_length(level_array1[0]); _row++) {
			var _terrain1 = procgen_get_terrain(level_array1,_col,_row);
			var _terrain2 = procgen_get_terrain(level_array2,_col,_row);
			var _result = min(_terrain1, _terrain2);
			//show_debug_message(string(_product));
			_new_level_array[_col][_row] = procgen_set_cell(_col,_row, _result);
		}
	}
	return _new_level_array;
}

function procgen_maximum_array(level_array1, level_array2) {
	var _new_level_array;
	for (var _col = 0; _col < array_length(level_array1); _col++) {
		for (var _row = 0; _row < array_length(level_array1[0]); _row++) {
			var _terrain1 = procgen_get_terrain(level_array1,_col,_row);
			var _terrain2 = procgen_get_terrain(level_array2,_col,_row);
			var _result = max(_terrain1, _terrain2);
			//show_debug_message(string(_product));
			_new_level_array[_col][_row] = procgen_set_cell(_col,_row, _result);
		}
	}
	return _new_level_array;
}


///===================================///
//	NOISE GENERATORS
///===================================///

function procgen_perlin_noise(width, height, lower_limit, upper_limit, inc, seed) {
	var _y_start = 0;
	var _x = 0;
	var _level_array;
	
	for (var _col = 0; _col < width; _col++) {
	
		var _y = _y_start;
		for (var _row = 0; _row < height; _row++) {
		
			var _val = perlin_noise(_x, _y, seed);
			var _col_val = map_value(_val, -1, 1, lower_limit-2, upper_limit+2);// desired_upper = number of terrain types
			_col_val = clamp(_col_val, lower_limit, upper_limit);
		
			_level_array[_col][_row] = procgen_set_cell(_col, _row, _col_val);
		
			_y += inc;
		}	
	
		_x += inc;
	}
	show_debug_message("perlin noise complete");
	return _level_array;
}

function perlin_noise(_x, _y = 867.5309, _z = 13.75) {
	#region //doubled perm table
	static _p = [
		
	
		151, 160, 137,  91,  90,  15, 131,  13, 201,  95,
		 96,  53, 194, 233,   7, 225, 140,  36, 103,  30,
		 69, 142,   8,  99,  37, 240,  21,  10,  23, 190,
		  6, 148, 247, 120, 234,  75,   0,  26, 197,  62,
		 94, 252, 219, 203, 117,  35,  11,  32,  57, 177,
		 33,  88, 237, 149,  56,  87, 174,  20, 125, 136,
		171, 168,  68, 175,  74, 165,  71, 134, 139,  48,
		 27, 166,  77, 146, 158, 231,  83, 111, 229, 122,
		 60, 211, 133, 230, 220, 105,  92,  41,  55,  46,
		245,  40, 244, 102, 143,  54,  65,  25,  63, 161,
		  1, 216,  80,  73, 209,  76, 132, 187, 208,  89,
		 18, 169, 200, 196, 135, 130, 116, 188, 159,  86,
		164, 100, 109, 198, 173, 186,   3,  64,  52, 217,
		226, 250, 124, 123,   5, 202,  38, 147, 118, 126,
		255,  82,  85, 212, 207, 206,  59, 227,  47,  16,
		 58,  17, 182, 189,  28,  42, 223, 183, 170, 213,
		119, 248, 152,   2,  44, 154, 163,  70, 221, 153,
		101, 155, 167,  43, 172,   9, 129,  22,  39, 253,
		 19,  98, 108, 110,  79, 113, 224, 232, 178, 185,
	    112, 104, 218, 246,  97, 228, 251,  34, 242, 193,
		238, 210, 144,  12, 191, 179, 162, 241,  81,  51,
		145, 235, 249,  14, 239, 107,  49, 192, 214,  31,
		181, 199, 106, 157, 184,  84, 204, 176, 115, 121,
		 50,  45, 127,   4, 150, 254, 138, 236, 205,  93,
		222, 114,  67,  29,  24,  72, 243, 141, 128, 195,
		 78,  66, 215,  61, 156, 180,
		 
		151, 160, 137,  91,  90,  15, 131,  13, 201,  95,
		 96,  53, 194, 233,   7, 225, 140,  36, 103,  30,
		 69, 142,   8,  99,  37, 240,  21,  10,  23, 190,
		  6, 148, 247, 120, 234,  75,   0,  26, 197,  62,
		 94, 252, 219, 203, 117,  35,  11,  32,  57, 177,
		 33,  88, 237, 149,  56,  87, 174,  20, 125, 136,
		171, 168,  68, 175,  74, 165,  71, 134, 139,  48,
		 27, 166,  77, 146, 158, 231,  83, 111, 229, 122,
		 60, 211, 133, 230, 220, 105,  92,  41,  55,  46,
		245,  40, 244, 102, 143,  54,  65,  25,  63, 161,
		  1, 216,  80,  73, 209,  76, 132, 187, 208,  89,
		 18, 169, 200, 196, 135, 130, 116, 188, 159,  86,
		164, 100, 109, 198, 173, 186,   3,  64,  52, 217,
		226, 250, 124, 123,   5, 202,  38, 147, 118, 126,
		255,  82,  85, 212, 207, 206,  59, 227,  47,  16,
		 58,  17, 182, 189,  28,  42, 223, 183, 170, 213,
		119, 248, 152,   2,  44, 154, 163,  70, 221, 153,
		101, 155, 167,  43, 172,   9, 129,  22,  39, 253,
		 19,  98, 108, 110,  79, 113, 224, 232, 178, 185,
	    112, 104, 218, 246,  97, 228, 251,  34, 242, 193,
		238, 210, 144,  12, 191, 179, 162, 241,  81,  51,
		145, 235, 249,  14, 239, 107,  49, 192, 214,  31,
		181, 199, 106, 157, 184,  84, 204, 176, 115, 121,
		 50,  45, 127,   4, 150, 254, 138, 236, 205,  93,
		222, 114,  67,  29,  24,  72, 243, 141, 128, 195,
		 78,  66, 215,  61, 156, 180
		 ];
	#endregion

    static _fade = function(_t) {
        return _t * _t * _t * (_t * (_t * 6 - 15) + 10);
    }

	static _lerp = function(_t, _a, _b) { 
		return _a + _t * (_b - _a); 
	}

    static _grad = function(_hash, _x, _y, _z) {
        var _h, _u, _v;
        _h = _hash & 15;                       // CONVERT 4 BITS OF HASH CODE
        _u = (_h < 8) ? _x : _y;               // INTO 12 GRADIENT DIRECTIONS.
        if (_h < 4) {
            _v = _y;
        } else if ((_h == 12) || (_h == 14)) {
            _v = _x;
        } else {
            _v = _z;
        }
		if ((_h & 1) != 0) {
			_u = -_u;
		}
		if ((_h & 2) != 0) {
			_v = -_v;
		}		
        return _u + _v;
    }

    var _X, _Y, _Z;
    _X = floor(_x);
    _Y = floor(_y);
    _Z = floor(_z);
    
    _x -= _X;
    _y -= _Y;
    _z -= _Z;
    
    _X = _X & 255;
    _Y = _Y & 255;
    _Z = _Z & 255;
    
    var _u, _v, _w;
    _u = _fade(_x);
    _v = _fade(_y);
    _w = _fade(_z);
    
    var A, AA, AB, B, BA, BB;
    A  = _p[_X]+_Y;
    AA = _p[A]+_Z;
    AB = _p[A+1]+_Z;
    B  = _p[_X+1]+_Y;
    BA = _p[B]+_Z;
    BB = _p[B+1]+_Z;

	//returns a number between -1 and 1
    return _lerp(_w, _lerp(_v, _lerp(_u,_grad(_p[AA  ], _x  , _y  , _z   ),  // AND ADD
										_grad(_p[BA  ], _x-1, _y  , _z   )), // BLENDED
                             _lerp(_u,	_grad(_p[AB  ], _x  , _y-1, _z   ),  // RESULTS
										_grad(_p[BB  ], _x-1, _y-1, _z   ))),// FROM  8
                    _lerp(_v, _lerp(_u,	_grad(_p[AA+1], _x  , _y  , _z-1 ),  // CORNERS
										_grad(_p[BA+1], _x-1, _y  , _z-1 )), // OF CUBE
                             _lerp(_u,	_grad(_p[AB+1], _x  , _y-1, _z-1 ),
										_grad(_p[BB+1], _x-1, _y-1, _z-1 ))));

}


///===================================///
//	CELLULAR AUTOMATA FUNCTIONS
///===================================///

function procgen_noise_edges(level_array, amount, noise_past) {
	var _level_width = array_length(level_array);
	var _level_height = array_length(level_array[0]);
	repeat(amount) {
		//create a temporary array
		var _tmp_array;
		//2D loop through old level array
		for (var _col = 0; _col < _level_width; _col++) {
			for (var _row = 0; _row < _level_height; _row++) {
				//sum neighbors terrain
				//var _col_dif, _row_dif;
				var _ter_sum = 0;
				var _this_ter = procgen_get_terrain(level_array, _col, _row);
				for (var _col_offset = -1; _col_offset < 2; _col_offset += 1) {//iterate thru neighbors
					for (var _row_offset = -1; _row_offset < 2; _row_offset += 1) {
						if (_col+_col_offset >= 0 && _col+_col_offset < array_length(level_array)) && (_row+_row_offset >= 0 && _row+_row_offset < array_length(level_array[0]))
							_ter_sum += procgen_get_terrain(level_array, _col+_col_offset, _row+_row_offset);
					}
				}
				_ter_sum -= _this_ter;
				_ter_sum /= 8;
				
				//apply rules for changing
				if _ter_sum < noise_past {
					_tmp_array[_col][_row] = procgen_set_cell(_col, _row, _this_ter);
				} else if _this_ter > _ter_sum {
					_tmp_array[_col][_row] = procgen_set_cell(_col, _row, _this_ter + choose(-1,0));
				} else {
					_tmp_array[_col][_row] = procgen_set_cell(_col, _row, _this_ter + irandom(_ter_sum/5-1));
				}
			}
		}
		level_array = _tmp_array;
	}
	return level_array;
}


///===================================///
//	AUTOTILING
///===================================///

/*
function procgen_autotile_map(level_array) {
	for (var _col = 0; _col < array_length(level_array); _col++) {
		for (var _row = 0; _row < array_length(level_array); _row++) {
			level_array[_col][_row] = procgen_autotile(level_array,_col,_row);
		}
	}
}*/

function procgen_autotile(level_array, col, row) {
	var _new_tiletype = 0;
	var _tile_terrain = procgen_get_terrain(level_array,col,row);
	//get neighbors terrain
	var _n = procgen_get_terrain(level_array,col,row-1),
		_ne = procgen_get_terrain(level_array,col+1,row-1),
		_e = procgen_get_terrain(level_array,col+1,row),
		_se = procgen_get_terrain(level_array,col+1,row+1),
		_s = procgen_get_terrain(level_array,col,row+1),
		_sw = procgen_get_terrain(level_array,col-1,row+1),
		_w = procgen_get_terrain(level_array,col-1,row),
		_nw = procgen_get_terrain(level_array,col-1,row-1);
	
	if _n == _tile_terrain _new_tiletype += 1;
	if _ne= _tile_terrain _new_tiletype += 2;
	if _e == _tile_terrain _new_tiletype += 4;
	if _se == _tile_terrain _new_tiletype += 8;
	if _s == _tile_terrain _new_tiletype += 16;
	if _sw == _tile_terrain _new_tiletype += 32;
	if _w == _tile_terrain _new_tiletype += 64;
	if _nw == _tile_terrain _new_tiletype += 128;
	
	return _new_tiletype+10;
}

function procgen_choose_tiletype(tileset, tiletype) {
	 
}


///===================================///
//	PROCGEN DRAW TILEMAP
///===================================///

function procgen_draw_tilemap(level_array, autotile = false, autotile_start = 0, autotile_end = 9, tilemap_array = []) {
	var _lay_id = layer_get_id("TilesTerrain");
	var _map_id = layer_tilemap_get_id(_lay_id);
	for (var _i = array_length(level_array)-1; _i >= 0; _i--) {//iterate thru width
		for (var _j = array_length(level_array[0])-1; _j >= 0; _j--) {//iterate thru height
			var _this_ter = procgen_get_terrain(level_array,_i,_j);
			if autotile {
				if _this_ter >= autotile_start && _this_ter <= autotile_end {
					var _tiletype = procgen_autotile(level_array,_i,_j);
					//set tile
					tilemap_set(asset_get_index("ts"+string(_this_ter)), _tiletype, _i,_j);
				} else {//autotiling but not this tile
					//set tile
					tilemap_set(_map_id, _this_ter, _i,_j);
				}
			} else {
				tilemap_set(_map_id, _this_ter, _i,_j);
			}
		}
	}
	if autotile {
		for (var _t = autotile_start; _t <= autotile_end; _t++) {
			draw_tilemap(tilemap_array[_t],0,0);
		}
	} else {
		draw_tilemap(_map_id,0,0);
		//draw_tilemap(tsTerrain,0,0);
	}
	show_debug_message("draw tilemap complete");
}


///===================================///
//	PROCGEN SAVE & LOAD FUNCTIONS (coming soon)
///===================================///
/*
function procgen_save_grid(level_array) {
	
}
*/