if (instance_exists(o_player)) {
	spawn_timer -= spawn_timer_inc*global.time;
	distance_to_player = abs(x-o_player.x)
	if (instance_number(o_enemy_blob) < 3 && spawn == noone && spawn_timer <= 0 && (distance_to_player > global.cam_w/2 && distance_to_player < global.cam_w)) {
		spawn_timer = spawn_timer_max * random_range(.5,1);
		spawn = instance_create_layer(x,bbox_bottom,layer,o_enemy_blob);
		with (spawn){
			despawner = true;
		}
	}
}

if (spawn != noone) {
	if (!instance_exists(spawn)) {
		spawn = noone;
	}
}