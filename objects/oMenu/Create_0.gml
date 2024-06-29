/// @desc init procgen menu

levelCreateName = ["Premade Circles", "Random Circles", "Perlin Noise"];
levelCreateObject = [oIslandCircles, oIslandRandom, oPerlinNoise];

///create blank level
levelObj = instance_create_depth(0,0,depth+1,pLevel);

var _menu_y = 320;
var _menu_x = 10;
var _btn_x_dist = 156;
var _btn_y_dist = 36;
var _btn_xscale = 19;
var _btn_yscale = 4;

//create menu buttons
for (var _i = 0; _i < array_length(levelCreateName); _i++) {
	instance_create_layer(_menu_x, _menu_y-_i*_btn_y_dist, layer, oButton, {
		text : levelCreateName[_i],
		levelObj : levelCreateObject[_i],
		image_xscale : _btn_xscale,
		image_yscale : _btn_yscale,
		onClick : function () {
			instance_destroy(pLevel);
			oMenu.levelObj = instance_create_layer(0, 0, layer, levelObj);
		}
	});
}

_menu_x += _btn_x_dist;

//create minus perlin button
instance_create_layer(_menu_x, _menu_y-2*_btn_y_dist, layer, oButton, {
	text : "- Perlin Noise",
	//levelObj : oMenu.levelObj,
	image_xscale : _btn_xscale,
	image_yscale : _btn_yscale,
	onClick : function () {
		var _levelArr = procgen_perlin_noise(oMenu.levelObj.width, oMenu.levelObj.height,1,6,.03, random(1000)*.99);
		oMenu.levelObj.levelArr = procgen_minimum_array(oMenu.levelObj.levelArr,_levelArr);
		procgen_draw_tilemap(oMenu.levelObj.levelArr,oMenu.levelObj.tileset);
	}
});

//create add perlin button
instance_create_layer(_menu_x, _menu_y-_btn_y_dist, layer, oButton, {
	text : "+ Perlin Noise",
	//levelObj : oMenu.levelObj,
	image_xscale : _btn_xscale,
	image_yscale : _btn_yscale,
	onClick : function () {
		var _levelArr = procgen_perlin_noise(oMenu.levelObj.width, oMenu.levelObj.height,1,6,.03, random(1000)*.99);
		oMenu.levelObj.levelArr = procgen_maximum_array(oMenu.levelObj.levelArr,_levelArr);
		procgen_draw_tilemap(oMenu.levelObj.levelArr,oMenu.levelObj.tileset);
	}
});

//create noise edges button
instance_create_layer(_menu_x, _menu_y, layer, oButton, {
	text : "Noise Edges",
	//levelObj : oMenu.levelObj,
	image_xscale : _btn_xscale,
	image_yscale : _btn_yscale,
	onClick : function () {
		oMenu.levelObj.levelArr = procgen_noise_edges(oMenu.levelObj.levelArr, 1, TERRAIN.WATER);
		procgen_draw_tilemap(oMenu.levelObj.levelArr,oMenu.levelObj.tileset);
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
		//oMenu.levelObj.levelArray = 
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
		oMenu.levelObj.levelArray = procgen_autotile();
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
	
}