/// @desc draw the camera

gpu_set_blendenable(false);
var _scale = window_get_width()/RESOLUTION_W;
draw_surface_ext(
	application_surface,
	0 - (frac(x)*_scale),
	0 - (frac(y)*_scale),
	_scale,
	_scale,
	0,
	c_white,
	1.0
);
gpu_set_blendenable(true);
