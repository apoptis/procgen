/// @desc camera step

//camera follows mouse
if instance_exists(follow) {
	if abs(follow.x - x) > 100*zoom
		xTo = follow.x;
	if abs(follow.y - y) > 100*zoom
		yTo = follow.y;
} else if instance_exists(oMouse) follow = oMouse;

//zoom
if mouse_wheel_down() {
	xTo = follow.x;
	yTo = follow.y;
	zoomTo += .2;
} else if mouse_wheel_up() {
	xTo = follow.x;
	yTo = follow.y;
	zoomTo -= .2;
} else if mouse_check_button(mb_middle) {
	xTo = follow.x;
	yTo = follow.y;
	zoomTo = 4;
}
zoomTo = clamp(zoomTo,zoomMin,zoomMax);

//update position
x += (xTo - x) / 15;
y += (yTo - y) / 15;
zoom += (zoomTo - zoom) / 15;
if zoomTo = zoomMax && zoom > zoomMax*.99 zoom = zoomMax;

//keep camera center inside room
x = clamp(x, viewWidthHalf*zoom, room_width-viewWidthHalf*zoom);
y = clamp(y, viewHeightHalf*zoom, room_height-viewHeightHalf*zoom);

if zoom != zoomTo
	camera_set_view_pos(cam,(x-viewWidthHalf*zoom),(y-viewHeightHalf*zoom));
else
	camera_set_view_pos(cam,floor(x-viewWidthHalf*zoom),floor(y-viewHeightHalf*zoom));
	
camera_set_view_size(cam,RESOLUTION_W*zoom,RESOLUTION_H*zoom);