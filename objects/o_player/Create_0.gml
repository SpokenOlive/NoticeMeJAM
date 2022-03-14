event_inherited();

// =====================
// PLAYER FUNCTIONS
// =====================
#region
	function checkpoint() {
		x = cur_checkpoint.x;
		y = cur_checkpoint.y;
	}

	function adjust_stats() {
		hp_max				= stats[eStat.hp].base			+ max(stats[eStat.hp].lvl-1,0);
		blaster_charge_inc	= stats[eStat.recharge].base	+ max(stats[eStat.recharge].lvl/4-1,0);
		blaster_charge_max	= stats[eStat.energy].base		+ max(stats[eStat.energy].lvl/4-1,0);
		damage				= stats[eStat.dmg].base			+ (stats[eStat.dmg].lvl-1);
	}

	function draw_gui_bar(sprite,xx,yy,cur,mx,offset) {
		for (var i = 0; i < mx; i++) {
			var index = 0;
			if (cur <= i) {
				index = 1;
			}
			draw_sprite(sprite,index,xx+(offset*i),yy);
		}
	}

	function setup_camera() {
		if (!view_enabled) {
			view_enabled = true;
			view_visible[0] = true;
		}

		camera	= view_camera[0];
		global.cam_x	= x;
		global.cam_y	= global.cam_h/2;
		view_mat= matrix_build_lookat(global.cam_x,global.cam_y,-1,global.cam_x,global.cam_y,0,0,1,0);
		proj_mat= matrix_build_projection_ortho(global.cam_w,global.cam_h,1.0,32000.0);
		camera_set_view_mat(camera,view_mat);
		camera_set_proj_mat(camera,proj_mat);
		camera_apply(camera);
	}
#endregion

// =====================
// SPRITES
// =====================
sprite_idle				= [s_player_idle,s_player_idle_shoot_forward,s_player_idle_shoot_up,s_player_idle_shoot_down];
sprite_run				= [s_player_run,s_player_run_shoot_forward,s_player_run_shoot_up,s_player_run_shoot_down];
sprite_jump				= [s_player_jump,s_player_jump_shoot_forward,s_player_jump_shoot_up,s_player_jump_shoot_down];

// =====================
// STATS
// =====================
<<<<<<< HEAD
stats[pStat.hp]			= { name: "HEALTH:",	base: 3, lvl: 1, mx: 10, cost: 10 };
stats[pStat.energy]		= { name: "ENERGY:",	base: 8, lvl: 1, mx: 10, cost: 10 };
stats[pStat.recharge]	= { name: "RECHARGE:",	base: 2, lvl: 1, mx: 10, cost: 10 };
stats[pStat.dmg]		= { name: "DAMAGE:",	base: 1, lvl: 1, mx: 10, cost: 10 };
=======
enum eStat {
	hp,
	energy,
	recharge,
	dmg,
}
stats[eStat.hp]			= { name: "HEALTH:",	base: 3, lvl: 1, mx: 10, cost: 10 };
stats[eStat.energy]		= { name: "ENERGY:",	base: 8, lvl: 1, mx: 10, cost: 10 };
stats[eStat.recharge]	= { name: "RECHARGE:",	base: 2, lvl: 1, mx: 10, cost: 10 };
stats[eStat.dmg]		= { name: "DAMAGE:",	base: 1, lvl: 1, mx: 10, cost: 10 };
>>>>>>> parent of 7f2d9b2 (yea)
upgrading				= false;
menu_index				= 0;

adjust_stats();

// =====================
// PLAYER VARIABLES
// =====================
hp_cur				= hp_max;
jump_from			= [x,y];
death_timer			= 2;
target				= p_enemy;
damage_type			= damage_types.energy;
stun_timer_max		= 2;
blaster_charge_cur	= blaster_charge_max;

//troubleshooting
//cur_grav	= 0;
scrap			= 0;
invul_timer_max	= 1;
invul_timer		= invul_timer_max;
cur_checkpoint	= noone;

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

setup_camera();
