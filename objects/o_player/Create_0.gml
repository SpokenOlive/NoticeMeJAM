event_inherited();

// =====================
// SPRITES
// =====================
sprite_idle				= [s_player_idle,s_player_idle_shoot_forward,s_player_idle_shoot_up,s_player_idle_shoot_down];
sprite_run				= [s_player_run,s_player_run_shoot_forward,s_player_run_shoot_up,s_player_run_shoot_down];
sprite_jump				= [s_player_jump,s_player_jump_shoot_forward,s_player_jump_shoot_up,s_player_jump_shoot_down];

// =====================
// PLAYER VARIABLES
// =====================
jump_from	= [x,y];
death_timer = 2;
target		= p_enemy;
damage_type	= damage_types.energy;
stun_timer_max	= 2;
magazine_max	= 8;
magazine_cur	= magazine_max;
magazine_inc	= 2;

//troubleshooting
//cur_grav	= 0;

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