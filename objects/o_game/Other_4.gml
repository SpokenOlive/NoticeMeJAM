if (room == rm_title) {
	room_goto(rm_test_level);
	exit;
}

if (!instance_exists(o_player)) {
	instance_create_layer(x,y,"player",o_player);		
}

if (instance_exists(o_player_spawn)) {
	with (o_player_spawn) {
		o_player.x = x;
		o_player.y = y;
		instance_destroy();
	}
}