event_inherited();

// ===========================
// FLYGUY 
// ===========================
ai_type			= ai_types.flyer;
sprite_move		= [s_enemy_flyguy_fly_day,s_enemy_flyguy_fly_night];
e_state			= e_states.approach;

haccel			*= 3
attack_timer_max= 2;
attack_timer	= attack_timer_max;
attack_timer_inc= 1;
alert_distance	= global.cam_w*2;
launch_frame	= 0;
projectile		= o_enemy_flyguy_shot;
shot_dir		= 0;
shot_spd_day	= 325;
shot_spd_night	= 400;
shot_spd		= shot_spd_day;
gravity_exempt		= true;

shot_count_max	= 3;
shot_count		= 0;

drops			= [o_scrap_smol,o_scrap_mid,noone];

// =====================
// STATS
// =====================
hp_max			= 3;
hp_cur			= hp_max;

// =====================
// MOVEMENT
// =====================
move_dir		= 0;
hspd_max_day	= 500;
hspd_max_night	= hspd_max_day*1.5;
hspd_max		= hspd_max_day;