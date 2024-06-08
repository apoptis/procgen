/// @desc init creation of random circles island

width = 640;
height = 360;

text = "Premade Circles Island";

levelGrid = procgen_init_level(width,height,TERRAIN.DEEPWATER);

tileset = layer_tilemap_get_id("TilesMain");

//levelGrid = procgen_make_rectangle(levelGrid, 20, 30, 600, 300, TERRAIN.SAND);
//levelGrid = procgen_make_rectangle(levelGrid, 50, 50, 540, 200, TERRAIN.GRASS);
//levelGrid = procgen_make_circle(levelGrid, floor(width/2), floor(height/2), 120, TERRAIN.FOREST);


levelGrid = procgen_make_circle(levelGrid, floor(width/2), floor(height/2), 160, TERRAIN.WATER);
levelGrid = procgen_make_circle(levelGrid, floor(width/2), floor(height/2), 140, TERRAIN.SAND);
levelGrid = procgen_make_circle(levelGrid, floor(width/2), floor(height/2), 120, TERRAIN.GRASS);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)-40, floor(height/2)-40, 60, TERRAIN.FOREST);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)-30, floor(height/2)+40, 50, TERRAIN.FOREST);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)+20, floor(height/2)+20, 50, TERRAIN.FOREST);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)+40, floor(height/2)-40, 40, TERRAIN.FOREST);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)-40, floor(height/2)-30, 40, TERRAIN.ROCK);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)+40, floor(height/2)-40, 30, TERRAIN.ROCK);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)+20, floor(height/2)+20, 20, TERRAIN.ROCK);

procgen_draw_tilemap(levelGrid,tileset);