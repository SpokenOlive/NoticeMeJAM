/*
k_left		= ord("A");
k_right		= ord("D");
k_up		= ord("W");
k_down		= ord("S");
k_button_1	= ord("J");
k_button_2	= ord("K");
k_button_3	= ord("L");
k_button_4	= ord(";");
*/

// =====================
// INPUTS AND ACTIONS
// =====================
var xaxis	= keyboard_check(k_right) - keyboard_check(k_left);
var up		= keyboard_check(k_up);
var down	= keyboard_check(k_down);
var jump	= keyboard_check_pressed(k_button_1);
var shoot	= keyboard_check_pressed(k_button_2);
var use     = keyboard_check_pressed(k_button_3);
var anim_array_index = 0;

if (upgrading) {
	var yaxis = keyboard_check_pressed(k_down) - keyboard_check_pressed(k_up);
	if (yaxis != 0) {
		menu_index = value_wrap(menu_index+yaxis,0,array_length(stats)+1);
	}
	
	if (menu_index < array_length(stats)) {
		var stat = stats[menu_index];
		if (shoot && scrap >= stat.cost && stat.lvl < stat.mx) {
			scrap -= stat.cost;
			stat.lvl += 1;
			adjust_stats();
		}
	}
	else if (shoot) {
		switch (menu_index) {
			case 4 : 
				o_game.advance_day();
			break;
			case 5 : 
				global.pause = false;
				upgrading = false;
			break;
		}
	}
}

switch (state) {
	case a_states.idle : 
	case a_states.moving : 
	case a_states.jumping : 
		if (global.pause) {
			break;
		}
		
		if (use) {
			if (place_meeting(x,y,o_cave)) {
				global.pause	= true;
				upgrading		= true;
			}
		}
		
		if (shoot && floor(blaster_charge_cur) > 0 && (!attacking || shot_timer < shot_timer_max*.75)) {
			blaster_charge_cur -= 1;
			var shot_origin = [x+64*image_xscale,y-72];
			var shot_dir	= 0;
			if (up) {
				shot_origin = [x+10*image_xscale,y-sprite_height];
				shot_dir	= 90;
			} 
			else if (down) {
				shot_origin = [x+10*image_xscale,bbox_bottom];
				shot_dir	= 270;
			}
			else {
				if (image_xscale < 0) {
					shot_dir = 180;
				}
			}
			attacking = true;
			shot_timer = shot_timer_max;
			with (instance_create_layer(shot_origin[0],shot_origin[1],layer,o_bullet)) {
				owner	= other.id;
				target	= owner.target;
				dir		= shot_dir;
				spd		= 1500;
				dmg		= owner.damage;
				type	= owner.damage_type;
				image_angle = dir;
			}
		}
		
		if (blaster_charge_cur < blaster_charge_max) {
			blaster_charge_cur = min(blaster_charge_cur + blaster_charge_inc * global.time, blaster_charge_max);
		}
		
		if (xaxis != 0) {
			image_xscale = xaxis;
			if (sign(hspd) != xaxis && on_floor) hspd *= -1;
			hspd += haccel*xaxis*global.time;
		}
		else {
			hspd = value_approach(hspd,0,hdecel*global.time);
		}
		
		if (jump && on_floor) {
			jump_from = [x,y];
			vspd = 0;
			vspd -= jspd;
		}
		
		if (attacking) {
			shot_timer = max(shot_timer - shot_timer_inc * global.time,0);
			if (shot_timer == 0) {
				attacking = false;
			}
		}
		
		if (!on_floor) {
			state =	a_states.jumping;
		}
		else if (hspd == 0) {
			state = a_states.idle;
		}
		else {
			state = a_states.moving;
		}
	break;
	case a_states.hurt :
		invulnerable = true;
	break;
	case a_states.die :
		hspd	= 0;
		state	= a_states.dead;
	break;
	case a_states.dead:
		sprite_index = s_player_collision_box;
		death_timer -= global.time;
		if (death_timer <= 0) {
			game_restart();
		}
	break;
}

if (x + hspd < 0) {
	hspd = 0;
}

if (x+hspd >= room_width) {
	room_restart();
}

// =====================
// CAMERA
// =====================
global.cam_x	= clamp(x,global.cam_w/2,room_width-global.cam_w/2);
view_mat= matrix_build_lookat(global.cam_x,global.cam_y,-1,global.cam_x,global.cam_y,0,0,1,0);
camera_set_view_mat(camera,view_mat);
camera_apply(camera);

// =====================
// SRPITES
// =====================
if (attacking) {
	if (up) {
		anim_array_index = 2;
	} 
	else if (down) {
		anim_array_index = 3;
	} 
	else {
		anim_array_index = 1;
	}
}

switch (state) {
	case a_states.idle : 
		sprite_index = sprite_idle[anim_array_index];// (attacking) ? sprite_shooting_idle : sprite_idle;
	break;
	case a_states.moving : 
		sprite_index = sprite_run[anim_array_index];// (attacking) ? sprite_shooting_run : sprite_run;
	break;
	case a_states.jumping : 
		sprite_index = sprite_jump[anim_array_index];// (attacking) ? sprite_shooting_jump : sprite_jump;
		if (vspd < 0) {
			image_index = 0;
		}
		else {
			image_index = 1;
		}
	break;
	case a_states.die :
		
	break;
	case a_states.dead:
		
	break;
}

// =====================
// PARENT
// =====================
event_inherited();


// =====================
// TROUBLESHOOTING
// =====================
if (y > room_height + BLOCKSIZE*2) {
	actor_take_hit(0,1,noone);
	checkpoint();
}