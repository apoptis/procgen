/// @desc init creation of random circles island

width = 640;
height = 360;

text = "Perlin Noise"

levelArr = procgen_init_level(width,height,TERRAIN.DEEPWATER);

tilesMain = layer_tilemap_get_id("TilesMain");
tilesTerrain = layer_tilemap_get_id("TilesTerrain");
randomize();

//create a map using perlin noise
levelArr = procgen_perlin_noise(width, height, 1, 6, .015, random(1000)*.99);

procgen_draw_tilemap(levelArr);