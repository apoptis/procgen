/// @desc init creation of random circles island

width = 640;
height = 360;

text = "Random Circles Island";

levelArr = procgen_init_level(width,height,TERRAIN.DEEPWATER);

tilesMain = layer_tilemap_get_id("TilesMain");
tilesTerrain = layer_tilemap_get_id("TilesTerrain");

//draw random circles
levelArr = procgen_make_circle(levelArr, floor(width/2), floor(height/2), 160, TERRAIN.WATER);
levelArr = procgen_make_circle(levelArr, floor(width/2), floor(height/2), 140, TERRAIN.SAND);
levelArr = procgen_make_circle(levelArr, floor(width/2), floor(height/2), 120, TERRAIN.GRASS);
levelArr = procgen_make_circle(levelArr, floor(width/2)+irandom_range(-40,40), floor(height/2)+irandom_range(-40,40), 60, TERRAIN.FOREST);
levelArr = procgen_make_circle(levelArr, floor(width/2)+irandom_range(-30,30), floor(height/2)+irandom_range(-40,40), 50, TERRAIN.FOREST);
levelArr = procgen_make_circle(levelArr, floor(width/2)+irandom_range(-40,40), floor(height/2)+irandom_range(-40,40), 50, TERRAIN.FOREST);
levelArr = procgen_make_circle(levelArr, floor(width/2)+irandom_range(-40,40), floor(height/2)+irandom_range(-40,40), 40, TERRAIN.FOREST);
repeat(10) {
	levelArr = procgen_make_circle(levelArr, floor(width/2)+irandom_range(-60,60), floor(height/2)+irandom_range(-60,60), irandom_range(20,30), TERRAIN.FOREST);
}
levelArr = procgen_make_circle(levelArr, floor(width/2)+irandom_range(-40,40), floor(height/2)+irandom_range(-60,40), 40, TERRAIN.ROCK);
levelArr = procgen_make_circle(levelArr, floor(width/2)+irandom_range(-40,40), floor(height/2)+irandom_range(-60,40), 30, TERRAIN.ROCK);
levelArr = procgen_make_circle(levelArr, floor(width/2)+irandom_range(-40,40), floor(height/2)+irandom_range(-40,40), 20, TERRAIN.ROCK);
repeat(10) {
	levelArr = procgen_make_circle(levelArr, floor(width/2)+irandom_range(-60,60), floor(height/2)+irandom_range(-60,60), irandom_range(10,20), TERRAIN.ROCK);
}

procgen_draw_tilemap(levelArr);