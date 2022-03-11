if (place_meeting(x,y,o_player)) {
	o_player.scrap += value;
	instance_destroy();
}

event_inherited();