/// @desc MACROS

#macro FRAME_RATE 60
#macro TILE_SIZE 16
//#macro ROOM_START rForest
//#macro UNLOCK_ALL false
#macro RESOLUTION_W 640
#macro RESOLUTION_H 360
//#macro INV_SIZE 50

#macro CARDINAL_DIR round(direction/90) % 4

#macro TSINE sin(current_time/10)
#macro TCOS cos(current_time/10)
#macro SLOWSINE sin(current_time/200)


/// ENUMS

enum TERRAIN { DEEPWATER, WATER, SAND, GRASS, FOREST, ROCK, MOUNTAIN, CLOUD };