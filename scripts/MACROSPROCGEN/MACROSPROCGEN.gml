/// @desc MACROS

#macro FRAME_RATE 60
#macro TILE_SIZE 16
#macro RESOLUTION_W 640
#macro RESOLUTION_H 360
#macro DEBUG false
#macro Debug:DEBUG true

#macro CARDINAL_DIR round(direction/90) % 4

#macro TSINE sin(current_time/10)
#macro TCOS cos(current_time/10)
#macro SLOWSINE sin(current_time/200)


/// ENUMS

enum TERRAIN { EMPTY, DEEPWATER, WATER, SAND, GRASS, FOREST, ROCK, MOUNTAIN, CLOUD };