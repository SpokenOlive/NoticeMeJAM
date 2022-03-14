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

function value_wrap(val,mn,mx) {
	if (val < mn) {
		return mx;
	}
	else if (val > mx) {
		return mn;
	}
	return val;
}

function in_cam_view(x,y) {
	return point_in_rectangle(x,y
				,global.cam_x-global.cam_w/2
				,global.cam_y-global.cam_h/2
				,global.cam_x+global.cam_w/2
				,global.cam_y+global.cam_h/2
				);
}



// =============================
// ACTOR FUNCTIONS
// =============================
enum a_states {
	idle,
	moving,
	melee,
	launch,
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
	blob,
	brawler,
	spitter,
	flyer,
}

enum damage_types {
	energy,
	melee,
}


// ===========================
// AI CONTROLLERS
// ===========================
// BLOB
function blob_controller() {
	if (!global.pause) {
		life_timer	-= life_timer_inc * global.time;
		if (life_timer <= 0) {
			e_state			= e_states.vanish;
			sprite_index	= sprite_vanish;
		}
	}
	
	switch (e_state) {
		case e_states.approach :
			if (hit_wall) {
				move_dir *= -1;
			}
			image_xscale	= move_dir;
			sprite_index	= sprite_move;
			hspd			= hspd_max * move_dir * global.time;
		break;
		case e_states.vanish :
			if (image_index >= image_number-.5) {
				instance_destroy();
			}
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
			image_xscale	= face_dir;
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

// BRAWLER
function spitter_controller() {
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
			image_xscale	= face_dir;
			move_dir		= (e_state == e_states.approach)? image_xscale : image_xscale * -1;
			hspd			= hspd_max * move_dir * global.time;
			
			if (in_cam_view(x,y) && attack_timer == 0) {
				hspd			= 0;
				image_index		= 0;
				sprite_index	= sprite_shoot;
				shot_dir		= (image_xscale > 0) ? 0 : 180;
				state			= a_states.launch;
				attack_timer	= attack_timer_max;
			}
		break;
	}
}

// FLYER
function flyer_controller() {
	e_state	= e_states.approach;
	switch (e_state) {
		case e_states.approach :
			if (attack_timer > 0) {
				attack_timer	= max(attack_timer - attack_timer_inc * global.time,0);
			}
			
			move_dir		= face_dir;
			image_xscale	= move_dir;
			sprite_index	= sprite_move;
			var faccel		= haccel;
			if (image_xscale != sign(hspd)) {
				faccel *= .5;
			}
			hspd			+= faccel * move_dir * global.time;
			
			if (in_cam_view(x,y) && attack_timer == 0) {
				if (shot_count < shot_count_max) {
					state			= a_states.launch;
					shot_dir		= direction_to_player;
					attack_timer	= attack_timer_max/10;;
					shot_count++;
				}
				else {
					shot_count = 0;
					attack_timer	= attack_timer_max;
				}
			}
		break;
	}
}