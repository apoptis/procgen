/// @desc init level creation

width = 640;
height = 360;

text = "Empty Level"

levelGrid = procgen_init_level(width,height,TERRAIN.DEEPWATER);

tileset = layer_tilemap_get_id("TilesMain");

procgen_draw_tilemap(levelGrid,tileset);

loadTime = 0;