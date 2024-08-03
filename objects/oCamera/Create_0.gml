/// @desc init camera

cam = view_camera[0];
viewWidthHalf = RESOLUTION_W * 0.5;
viewHeightHalf = RESOLUTION_H * 0.5;

//application surface override
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
application_surface_draw_enable(false);

follow = oMouse;

xTo = x;
yTo = y;
zoom = 16;
zoomTo = zoom;
zoomMin = 0.2;
zoomMax = 16;
zoomInc = 0.1;
zoomSpd = 1;//for zoom acceleration

cameraLock = false;

dbg = dbg_view("Camera Debug", true);
dbg_section("Position");
dbg_text_input(ref_create(self.id, "x"), "X", "r");
dbg_text_input(ref_create(self.id, "y"), "Y", "r");
dbg_text_input(ref_create(self.id, "zoom"), "Zoom", "r");
dbg_text_input(ref_create(self.id, "zoomSpd"), "ZoomSpeed", "r");
dbg_button("Reset Camera", function() {
	xTo = viewWidthHalf;
	yTo = viewHeightHalf;
	zoomTo = zoomMax;
});