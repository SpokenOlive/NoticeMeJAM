global.cam_w		= 1366;
global.cam_h		= 768;
global.cam_x		= 0;
global.cam_y		= 0;

background_colors[0] = c_red;//make_color_rgb(237,210,245);
background_colors[1] = c_yellow;//make_color_rgb(41,173,229);
background_colors[2] = c_orange;//make_color_rgb(178,43,115);
background_colors[3] = c_black;//make_color_rgb(32,76,43);

tod				= 0;
tod_timer		= 60;
tod_last_tick	= tod_timer;
tick			= tod_timer/array_length(background_colors);
global.nighttime	= false;

layer_background_blend(layer_background_get_id(layer_get_id("Background")),c_red);

global.pause		= false;

function tod_switch() {
	if (global.pause) {
		return;
	}
	
	// tick time;
	tod_timer -= global.time;
	
	if (global.nighttime) {
		if (tod_timer <= 0) {
			tod			= 0;
			tod_timer	= 60;
			global.nighttime = false;
		}
	}
	else if (tod_last_tick - tod_timer >= tick) {
		tod_last_tick = tod_timer;
		tod			 += 1;
		if (tod == array_length(background_colors)-1) {
			tod_timer = 30;
			global.nighttime = true;
		}
	}
	
	layer_background_blend(layer_background_get_id(layer_get_id("Background")),background_colors[tod]);
	
}