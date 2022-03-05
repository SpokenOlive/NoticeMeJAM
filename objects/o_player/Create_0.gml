// =====================
// SPRITES
// =====================
sprite_idle = s_player_idle;
sprite_run	= s_player_run;
sprite_jump	= s_player_jump;

// =====================
// MOVEMENT
// =====================
hspd		= 0;
hspd_max	= 500;
haccel		= 20;
hdecel		= 50;
vspd		= 0;
vspd_max	= 1200;
grav		= 50;
jspd		= 25;

//troubleshooting
cur_grav	= 0;

// =====================
// FLAGS
// =====================
on_floor	= true;

// =====================
// INPUTS
// =====================
k_left		= ord("A");
k_right		= ord("D");
k_up		= ord("W");
k_down		= ord("S");
k_button_1	= ord("J");
k_button_2	= ord("K");
k_button_3	= ord("L");
k_button_4	= ord(";");



// =====================
// CAMERA
// =====================
if (!view_enabled) {
	view_enabled = true;
	view_visible[0] = true;
}

camera	= view_camera[0];
zoom	= 1;
cam_w	= 1366 * zoom;
cam_h	= 768 * zoom;
cam_x	= x;
cam_y	= cam_h/2;
view_mat= matrix_build_lookat(cam_x,cam_y,-1,cam_x,cam_y,0,0,1,0);
proj_mat= matrix_build_projection_ortho(cam_w,cam_h,1.0,32000.0);
camera_set_view_mat(camera,view_mat);
camera_set_proj_mat(camera,proj_mat);
camera_apply(camera);


