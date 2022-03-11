// ===========================
// P_ENEMY
// ===========================

if (instance_exists(o_player)) {
	distance_to_player	= abs(o_player.x - x);
	direction_to_player	= point_direction(x,y,o_player.x,o_player.y);
}
else {
	distance_to_player	= -1;
	direction_to_player	= 0;
}

face_dir = (direction_to_player >= 90 && direction_to_player <= 270) ? -1 : 1;

switch (state) {
	case a_states.idle : 
	case a_states.moving : 
		if (alert) {
			switch (ai_type) {
				case ai_types.blob: blob_controller(); break;
				case ai_types.brawler: brawler_controller(); break;
				case ai_types.spitter: spitter_controller(); break;
				case ai_types.flyer: flyer_controller(); break;
			}
		}
		else {
			e_state = e_states.wait;
			if (distance_to_player <= alert_distance) {
				alert = true;
			}
		}
	break;
	case a_states.die :
		hspd	= 0;
		instance_create_layer(x,y-sprite_get_height(mask_index)/2,layer,o_enemy_death_blurb);
		var drop = drops[irandom(array_length(drops)-1)];
		if (drop != noone) {
			instance_create_layer(x,y-sprite_get_height(mask_index)/2,layer,drop);
		}
		state	= a_states.dead;
	break;
	case a_states.dead :
		instance_destroy();
	break;
}

event_inherited();