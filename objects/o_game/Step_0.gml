global.time = delta_time/1000000;

global.tod_timer	-= global.time;
if (global.tod_timer <= 0) {
	tod_switch();
}

if (instance_exists(o_player)) {
	// =====================
	// CAMERA
	// =====================
	//with (o_player) {
	//	cam_x	= clamp(x,global.cam_w/2,room_width-global.cam_w/2);
	//	view_mat= matrix_build_lookat(cam_x,cam_y,-1,cam_x,cam_y,0,0,1,0);
	//	camera_set_view_mat(camera,view_mat);
	//	camera_apply(camera);
	//}
	
	layer_x("tod",global.cam_x);
}
//if (instance_exists(o_player)) {
//	spawn_timer -= spawn_timer_inc*global.time;
//	if (spawn_timer <= 0) {
//		spawn_timer = spawn_timer_max * random_range(.5,1);
//		instance_create_layer(o_player.x+BLOCKSIZE*10*choose(-1,1),640,layer,o_enemy_blob);
//	}
//}