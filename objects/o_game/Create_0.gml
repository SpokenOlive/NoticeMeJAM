global.cam_w		= 1366;
global.cam_h		= 768;
global.cam_x		= 0;
global.cam_y		= 0;


title_menu[0] = "ARCADE MODE";
title_menu[1] = "NIGHT ONLY MODE";
title_menu[2] = "QUIT";



background_colors[0] = c_yellow;//make_color_rgb(237,210,245);
background_colors[1] = c_aqua;//make_color_rgb(41,173,229);
background_colors[2] = c_red;//make_color_rgb(178,43,115);
background_colors[3] = c_black;//make_color_rgb(32,76,43);

day_count		= 1;
day_length		= 120;
night_length	= 30;
tod				= 0;
tod_timer		= day_length;
tod_last_tick	= tod_timer;
tick			= tod_timer/array_length(background_colors);
global.nighttime	= false;
global.pause		= false;

layer_background_blend(layer_background_get_id(layer_get_id("Background")),c_red);

function advance_day() {
	day_count	++;
	tod			= 0;
	tod_timer	= day_length;
	global.nighttime = false;
}

function tod_switch() {
	if (global.pause) {
		return;
	}
	
	// tick time;
	tod_timer -= global.time;
	
	if (global.nighttime && tod_timer <= 0) {
		advance_day();
	}
	else if (tod_last_tick - tod_timer >= tick) {
		tod_last_tick = tod_timer;
		tod			 += 1;
		if (tod == array_length(background_colors)-1) {
			tod_timer = night_length;
			global.nighttime = true;
		}
	}
	
	layer_background_blend(layer_background_get_id(layer_get_id("Background")),background_colors[tod]);
}