/// @desc init creation of random circles island

width = 640;
height = 360;

text = "Random Circles Island";

levelGrid = procgen_init_level(width,height,TERRAIN.DEEPWATER);

tileset = layer_tilemap_get_id("TilesMain");

//draw random circles
levelGrid = procgen_make_circle(levelGrid, floor(width/2), floor(height/2), 160, TERRAIN.WATER);
levelGrid = procgen_make_circle(levelGrid, floor(width/2), floor(height/2), 140, TERRAIN.SAND);
levelGrid = procgen_make_circle(levelGrid, floor(width/2), floor(height/2), 120, TERRAIN.GRASS);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)+irandom_range(-40,40), floor(height/2)+irandom_range(-40,40), 60, TERRAIN.FOREST);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)+irandom_range(-30,30), floor(height/2)+irandom_range(-40,40), 50, TERRAIN.FOREST);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)+irandom_range(-40,40), floor(height/2)+irandom_range(-40,40), 50, TERRAIN.FOREST);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)+irandom_range(-40,40), floor(height/2)+irandom_range(-40,40), 40, TERRAIN.FOREST);
repeat(10) {
	levelGrid = procgen_make_circle(levelGrid, floor(width/2)+irandom_range(-60,60), floor(height/2)+irandom_range(-60,60), irandom_range(20,30), TERRAIN.FOREST);
}
levelGrid = procgen_make_circle(levelGrid, floor(width/2)+irandom_range(-40,40), floor(height/2)+irandom_range(-60,40), 40, TERRAIN.ROCK);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)+irandom_range(-40,40), floor(height/2)+irandom_range(-60,40), 30, TERRAIN.ROCK);
levelGrid = procgen_make_circle(levelGrid, floor(width/2)+irandom_range(-40,40), floor(height/2)+irandom_range(-40,40), 20, TERRAIN.ROCK);
repeat(10) {
	levelGrid = procgen_make_circle(levelGrid, floor(width/2)+irandom_range(-60,60), floor(height/2)+irandom_range(-60,60), irandom_range(10,20), TERRAIN.ROCK);
}

//levelGrid = procgen_cellauto_iterate(levelGrid, 3);

procgen_draw_tilemap(levelGrid,tileset);