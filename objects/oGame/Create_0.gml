/// @desc init procgen menu

///create blank level
levelObj = instance_create_depth(0,0,depth+1,pLevel);

///terrain types, resolution, tilesize set in MACROSPROCGEN
/*
//number of terrain types
terrain_types = 9;//0-8
terrain_layer = [];
terrain_tilemap = [];
//set tile layer for each terrain type
var _this_depth = layer_get_depth("TilesTerrain");
for (var _t = 0; _t < terrain_types; _t++) {
	//create a layer for each terrain type
	terrain_layer[_t] = layer_create(_this_depth-1*_t);
	//create a new tilemap for each terrain type
	terrain_tilemap[_t] = layer_tilemap_create(terrain_layer[_t],0,0,);
}*/
var _terrain_depth = layer_get_depth("TilesTerrain");
terrain_layer[TERRAIN.GRASS] = layer_create(_terrain_depth-1);
//var _tileset1 = asset_get_index("ts"+string(TERRAIN.GRASS));
//show_debug_message("created tileset : " + string(_tileset1));

var _tileset4 = ts4;
terrain_tilemap[TERRAIN.GRASS] = layer_tilemap_create(terrain_layer[TERRAIN.GRASS],0,0,_tileset4,levelObj.width,levelObj.height);

var _menu_y = 320;
var _menu_x = 10;
var _btn_x_dist = 156;
var _btn_y_dist = 36;
var _btn_xscale = 19;
var _btn_yscale = 4;

//create menu buttons
levelCreateName = ["Premade Circles", "Random Circles", "Perlin Noise"];
levelCreateObject = [oIslandCircles, oIslandRandom, oPerlinNoise];
for (var _i = 0; _i < array_length(levelCreateName); _i++) {
	instance_create_layer(_menu_x, _menu_y-_i*_btn_y_dist, layer, oButton, {
		text : levelCreateName[_i],
		levelObj : levelCreateObject[_i],
		image_xscale : _btn_xscale,
		image_yscale : _btn_yscale,
		onClick : function () {
			instance_destroy(pLevel);
			oGame.levelObj = instance_create_layer(0, 0, layer, levelObj);
		}
	});
}

_menu_x += _btn_x_dist;

//create minus perlin button
instance_create_layer(_menu_x, _menu_y-2*_btn_y_dist, layer, oButton, {
	text : "- Perlin Noise",
	//levelObj : oGame.levelObj,
	image_xscale : _btn_xscale,
	image_yscale : _btn_yscale,
	onClick : function () {
		var _levelArr = procgen_perlin_noise(oGame.levelObj.width, oGame.levelObj.height,1,6,.03, random(1000)*.99);
		oGame.levelObj.levelArr = procgen_minimum_array(oGame.levelObj.levelArr,_levelArr);
		procgen_draw_tilemap(oGame.levelObj.levelArr);
	}
});

//create add perlin button
instance_create_layer(_menu_x, _menu_y-_btn_y_dist, layer, oButton, {
	text : "+ Perlin Noise",
	//levelObj : oGame.levelObj,
	image_xscale : _btn_xscale,
	image_yscale : _btn_yscale,
	onClick : function () {
		var _levelArr = procgen_perlin_noise(oGame.levelObj.width, oGame.levelObj.height,1,6,.03, random(1000)*.99);
		oGame.levelObj.levelArr = procgen_maximum_array(oGame.levelObj.levelArr,_levelArr);
		procgen_draw_tilemap(oGame.levelObj.levelArr);
	}
});

//create noise edges button
instance_create_layer(_menu_x, _menu_y, layer, oButton, {
	text : "Noise Edges",
	//levelObj : oGame.levelObj,
	image_xscale : _btn_xscale,
	image_yscale : _btn_yscale,
	onClick : function () {
		oGame.levelObj.levelArr = procgen_noise_edges(oGame.levelObj.levelArr, 1, TERRAIN.WATER);
		procgen_draw_tilemap(oGame.levelObj.levelArr);
	}
});

_menu_x += _btn_x_dist;

//create river button
/*
instance_create_layer(_menu_x, _menu_y, layer, oButton, {
	text : "Make River",
	image_xscale : _btn_xscale,
	image_yscale : _btn_yscale,
	onClick : function () {
		//oGame.levelObj.levelArray = 
	}
});
*/

_menu_x += _btn_x_dist;

//create autotile button

instance_create_layer(_menu_x, _menu_y, layer, oButton, {
	text : "Auto Tile",
	image_xscale : _btn_xscale,
	image_yscale : _btn_yscale,
	onClick : function () {
		procgen_draw_tilemap(oGame.levelObj.levelArr, true, 4,4, oGame.terrain_tilemap);
	}
});


//create clear button
instance_create_layer(_menu_x, 10, layer, oButton, {
	text : "Clear All",
	image_xscale : _btn_xscale,
	image_yscale : _btn_yscale,
	onClick : function () {
		game_restart();
	}
});


/// DEBUG

if DEBUG {
	show_debug_overlay(true);
} else {
	window_set_cursor(cr_none);
}