event_inherited();

// =====================
// SPRITES
// =====================
sprite_idle				= s_player_idle;
sprite_run				= s_player_run;
sprite_jump				= s_player_jump;
sprite_shooting_idle	= s_player_shoot_idle;
sprite_shooting_run		= s_player_shoot_run;
sprite_shooting_jump	= s_player_shoot_jump;

// =====================
// PLAYER VARIABLES
// =====================
jump_from	= [x,y];
death_timer = 2;
target		= p_enemy;
damage_type	= damage_types.energy;

//troubleshooting
cur_grav	= 0;

// =====================
// INPUTS
// =====================
k_left		= ord("A");
k_right		= ord("D");
k_up		= ord("W");
k_down		= ord("S");
k_button_1	= vk_space;
k_button_2	= ord("K");
k_button_3	= ord("L");
k_button_4	= ord(";");

// =====================
// CAMERA
// =====================
function setup_camera() {
	if (!view_enabled) {
		view_enabled = true;
		view_visible[0] = true;
	}

	camera	= view_camera[0];
	cam_x	= x;
	cam_y	= global.cam_h/2;
	view_mat= matrix_build_lookat(cam_x,cam_y,-1,cam_x,cam_y,0,0,1,0);
	proj_mat= matrix_build_projection_ortho(global.cam_w,global.cam_h,1.0,32000.0);
	camera_set_view_mat(camera,view_mat);
	camera_set_proj_mat(camera,proj_mat);
	camera_apply(camera);
}

setup_camera();