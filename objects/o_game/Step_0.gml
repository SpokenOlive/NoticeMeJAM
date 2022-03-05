global.time = delta_time/1000000;

if (instance_exists(o_player)) {
	spawn_timer -= spawn_timer_inc*global.time;
	if (spawn_timer <= 0) {
		spawn_timer = spawn_timer_max * random_range(.5,1);
		instance_create_layer(o_player.x+BLOCKSIZE*10*choose(-1,1),640,layer,o_enemy_blob);
	}
}