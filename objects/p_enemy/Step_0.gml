// ===========================
// P_ENEMY
// ===========================

if (instance_exists(o_player)) {
	distance_to_player	= abs(o_player.x - x);
	direction_to_player	= sign(o_player.x - x);
}
else {
	distance_to_player	= -1;
	direction_to_player	= 0;
}

switch (state) {
	case a_states.idle : 
	case a_states.moving : 
		if (alert) {
			switch (ai_type) {
				case ai_types.goomba: goomba_controller(); break;
				case ai_types.brawler: brawler_controller(); break;
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
		//for (var i = -1; i <= 1; i++) {
		//	if (i == 0) {
		//		continue;
		//	}
			
		//	with (instance_create_layer(x,y,layer,o_enemy_death_chunk)) {
		//		dir		= sign(i);
		//		xspd	= choose(100,200,300) * random_range(.2,.6);
		//		yspd	= choose(300,600) * random_range(.2,.6) * -1;
		//	}
		//}
		instance_create_layer(x,y-sprite_get_height(mask_index)/2,layer,o_enemy_death_blurb);
		state	= a_states.dead;
	break;
	case a_states.dead:
		instance_destroy();
	break;
}

event_inherited();