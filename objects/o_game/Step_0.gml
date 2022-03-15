global.time = delta_time/1000000;

tod_switch();

if (keyboard_check_pressed(vk_escape)) {
	global.pause = !global.pause;
	if (o_player.upgrading) {
		o_player.upgrading = false;
	}
}