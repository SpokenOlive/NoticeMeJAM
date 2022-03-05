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
var jump	= keyboard_check_pressed(k_button_1);
var shoot	= keyboard_check_pressed(k_button_2);

switch (state) {
	case a_states.idle : 
	case a_states.moving : 
		if (shoot && (!attacking || shot_timer < shot_timer_max*.75)) {
			attacking = true;
			shot_timer = shot_timer_max;
			with (instance_create_layer(x+52*image_xscale,y-72,layer,o_bullet)) {
				owner = other.id;
				dir = owner.image_xscale;
				spd = 1500;
				dmg = 1;
			}
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
	break;
}

// =====================
// CAMERA
// =====================
cam_x	= clamp(x,cam_w/2,room_width-cam_w/2);
view_mat= matrix_build_lookat(cam_x,cam_y,-1,cam_x,cam_y,0,0,1,0);
camera_set_view_mat(camera,view_mat);
camera_apply(camera);

// =====================
// APPLY MOVEMENT
// =====================
vspd += ((vspd < 0) ? grav : grav * 1.5)*global.time;

hspd = clamp(hspd, -hspd_max*global.time, hspd_max*global.time);
vspd = clamp(vspd, -vspd_max*global.time, vspd_max*global.time);

if (place_meeting(x+hspd,y,o_solid)) {
	var inc = sign(hspd);
	while(!place_meeting(x+inc,y,o_solid)) {
		x += inc;
	}
	hspd = 0;
}
x += hspd;

if (place_meeting(x,y+vspd,o_solid)) {
	var inc = sign(vspd);
	while(!place_meeting(x,y+inc,o_solid)) {
		y += inc;
	}
	vspd = 0;
}

y += vspd;

on_floor = place_meeting(x,y+1,o_solid);



// =====================
// SRPITES
// =====================
if (on_floor) {
	if (hspd == 0) {
		sprite_index = (attacking) ? sprite_shooting_idle : sprite_idle;
	}
	else {
		sprite_index = (attacking) ? sprite_shooting_run : sprite_run;
	}
}
else {
	sprite_index = (attacking) ? sprite_shooting_jump : sprite_jump;
	if (vspd < 0) {
		image_index = 0;
	}
	else {
		image_index = 1;
	}
}



// =====================
// TROUBLESHOOTING
// =====================
if (y > room_height + BLOCKSIZE*2) {
	x = jump_from[0];
	y = jump_from[1]-8;
}