global.cam_w		= 1366;
global.cam_h		= 768;
global.cam_x		= 0;
global.cam_y		= 0;

global.tod			= 0;
global.tod_timer	= 30;

function tod_switch() {
	global.tod += 1;
	if (global.tod == 2) {
		global.tod = 0;
		layer_background_blend(layer_background_get_id(layer_get_id("Background")),c_red);
	}
	else {
		layer_background_blend(layer_background_get_id(layer_get_id("Background")),c_black);
	}
	
	with (p_enemy) {
		set_night_stats();
	}
	
	global.tod_timer	= 30;
}