/// @desc init creation of random circles island

width = 640;
height = 360;

text = "Premade Circles Island";

levelArray = procgen_init_level(width,height,TERRAIN.DEEPWATER);

tilesMain = layer_tilemap_get_id("TilesMain");
tilesTerrain = layer_tilemap_get_id("TilesTerrain");

//levelArray = procgen_make_rectangle(levelArray, 20, 30, 600, 300, TERRAIN.SAND);
//levelArray = procgen_make_rectangle(levelArray, 50, 50, 540, 200, TERRAIN.GRASS);
//levelArray = procgen_make_circle(levelArray, floor(width/2), floor(height/2), 120, TERRAIN.FOREST);


levelArray = procgen_make_circle(levelArray, floor(width/2), floor(height/2), 160, TERRAIN.WATER);
levelArray = procgen_make_circle(levelArray, floor(width/2), floor(height/2), 140, TERRAIN.SAND);
levelArray = procgen_make_circle(levelArray, floor(width/2), floor(height/2), 120, TERRAIN.GRASS);
levelArray = procgen_make_circle(levelArray, floor(width/2)-40, floor(height/2)-40, 60, TERRAIN.FOREST);
levelArray = procgen_make_circle(levelArray, floor(width/2)-30, floor(height/2)+40, 50, TERRAIN.FOREST);
levelArray = procgen_make_circle(levelArray, floor(width/2)+20, floor(height/2)+20, 50, TERRAIN.FOREST);
levelArray = procgen_make_circle(levelArray, floor(width/2)+40, floor(height/2)-40, 40, TERRAIN.FOREST);
levelArray = procgen_make_circle(levelArray, floor(width/2)-40, floor(height/2)-30, 40, TERRAIN.ROCK);
levelArray = procgen_make_circle(levelArray, floor(width/2)+40, floor(height/2)-40, 30, TERRAIN.ROCK);
levelArray = procgen_make_circle(levelArray, floor(width/2)+20, floor(height/2)+20, 20, TERRAIN.ROCK);

procgen_draw_tilemap(levelArr);