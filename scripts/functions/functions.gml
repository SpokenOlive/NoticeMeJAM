function LOG(str) {
	show_debug_message(".> " + string(str));
}

function value_approach(value,target,inc) {
	if (value > target) {
		value -= inc;
		if (value < target) {
			return target;
		}
	}
	else if (value < target) {
		value += inc;
		if (value > target) {
			return target;
		}
	}
	
	return value;
}

function in_cam_view(x,y) {
	if (!instance_exists(o_player)) {
		return false;
	}
	return point_in_rectangle(x,y
				,o_player.cam_x-global.cam_w/2
				,o_player.cam_y-global.cam_h/2
				,o_player.cam_x+global.cam_w/2
				,o_player.cam_y+global.cam_h/2
				);
}



// =============================
// ACTOR FUNCTIONS
// =============================
enum a_states {
	idle,
	moving,
	melee,
	jumping,
	hurt,
	die,
	dead,
}

enum e_states {
	appear,
	wait,
	approach,
	retreat,
	vanish,
}

enum ai_types {
	goomba,
	brawler,
	ranger,
}

enum damage_types {
	energy,
	melee,
}


// ===========================
// AI CONTROLLERS
// ===========================
// GOOMBA
function goomba_controller() {
	switch (e_state) {
		case e_states.approach :
			if (hspd == 0) {
				move_dir *= -1;
			}
			image_xscale	= move_dir;
			sprite_index	= sprite_move;
			hspd			= hspd_max * move_dir * global.time;
		break;
	}
		
	if (place_meeting(x,y,o_player)) {
		o_player.actor_take_hit(sign(x - o_player.x),1,damage_type);
		actor_take_hit(0,3,noone);
	}
}

// BRAWLER
function brawler_controller() {
	if (attack_timer > 0) {
		attack_timer	= max(attack_timer - attack_timer_inc * global.time,0);
		sprite_index	= sprite_move;
		e_state			= e_states.wait;
	}
	else {
		e_state = e_states.approach;
	}
	
	switch (e_state) {
		case e_states.approach :
		case e_states.retreat :
			sprite_index	= sprite_move;
			image_xscale	= direction_to_player;
			move_dir		= (e_state == e_states.approach)? image_xscale : image_xscale * -1;
			hspd			= hspd_max * move_dir * global.time;
			
			if (distance_to_player <= melee_distance && attack_timer == 0) {
				hspd			= 0;
				image_index		= 0;
				sprite_index	= sprite_melee;
				state			= a_states.melee;
				attack_timer	= attack_timer_max;
			}
		break;
	}
}