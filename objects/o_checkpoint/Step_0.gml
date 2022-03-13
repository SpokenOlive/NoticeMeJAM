if (active == true) {
	image_index = 1;
}
else {
	image_index = 0;
	if (place_meeting(x,y,o_player)) {
		active = true;
		o_player.cur_checkpoint = id;
	}
}