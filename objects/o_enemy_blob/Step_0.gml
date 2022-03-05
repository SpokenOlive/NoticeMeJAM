switch (state) {
	case a_states.idle : 
	case a_states.moving : 
		switch (e_state) {
			case e_states.approach :
				sprite_index = sprite_move;
				x += hspd_max * move_dir * global.time;
			break;
		}
		
		if (place_meeting(x,y,o_player)) {
			o_player.actor_take_damage(sign(o_player.x - x),1,noone);
			actor_take_damage(0,3,noone);
		}
	break;
	case a_states.die :
		hspd	= 0;
		for (var i = -1; i <= 1; i++) {
			if (i == 0) {
				continue;
			}
			
			with (instance_create_layer(x,y,layer,o_enemy_blob_death_chunk)) {
				dir		= sign(i);
				xspd	= choose(100,200,300) * random_range(.2,.6);
				yspd	= choose(300,600) * random_range(.2,.6) * -1;
			}
		}
		state	= a_states.dead;
	break;
	case a_states.dead:
		instance_destroy();
	break;
}

event_inherited();