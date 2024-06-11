/// @desc init creation of random circles island

width = 640;
height = 360;

text = "Perlin Noise"

levelGrid = procgen_init_level(width,height,TERRAIN.DEEPWATER);

tileset = layer_tilemap_get_id("TilesMain");
randomize();

//create a map using perlin noise
levelGrid = procgen_perlin_noise(width, height, 1, 6, .02, random(1000)*.99);

procgen_draw_tilemap(levelGrid,tileset);