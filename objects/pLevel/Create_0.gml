/// @desc init level creation

width = 640;
height = 360;

text = "Empty Level"

levelArr = procgen_init_level(width,height,TERRAIN.DEEPWATER);

//tilesMain = layer_tilemap_get_id("TilesMain");
tilesTerrain = layer_tilemap_get_id("TilesTerrain");

procgen_draw_tilemap(levelArr);

loadTime = 0;