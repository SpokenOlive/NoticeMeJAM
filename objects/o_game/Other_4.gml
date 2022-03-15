if (room == rm_title) {
	room_goto(rm_level_3);
	exit;
}

var music = noone;
switch (room) {
	case rm_level_1 :
	//case rm_level_2 :
	//case rm_test_level1 :
		music = music_BlastEmG;
	break;
}

if (!audio_is_playing(music)) {
	audio_play_sound_on(global.music_emitter,music,true,10);
}

if (!instance_exists(o_player)) {
	instance_create_layer(x,y,"player",o_player);		
}

var checkpoints = ds_priority_create();
for (var i = 0; i < instance_number(o_checkpoint); i++) {
	var ocp = instance_find(o_checkpoint,i);
	ds_priority_add(checkpoints,ocp,ocp.x);
}

if (ds_priority_size(checkpoints) > 0) {
	with (ds_priority_find_min(checkpoints)) {
		o_player.x = x;
		o_player.y = y;
	}
}

ds_priority_destroy(checkpoints);