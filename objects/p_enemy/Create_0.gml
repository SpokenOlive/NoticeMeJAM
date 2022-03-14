event_inherited();

// ===========================
// VARIABLES
// ===========================
ai_type				= noone;
alert				= false;
alert_distance		= global.cam_w + BLOCKSIZE;
distance_to_player	= -1;
direction_to_player	= 0;
e_state				= e_states.wait;
face_dir			= 0;
move_dir			= 0;	
target				= o_player;
attack_timer_max	= 1;
attack_timer_inc	= 1;
attack_timer		= 0;
edge_aware			= true;
drops				= [noone];