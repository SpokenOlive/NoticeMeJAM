global.time = delta_time/1000000;

if (room == rm_title) {
	
	exit;
}


tod_switch();

if (instance_exists(o_player)) {	
	//layer_x("tod",global.cam_x);
}

if (keyboard_check_pressed(vk_escape)) {
	global.pause = !global.pause;
	if (o_player.upgrading) {
		o_player.upgrading = false;
	}
}