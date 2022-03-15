event_inherited();

// ===========================
// SPITTER 
// ===========================
ai_type			= ai_types.spitter;
sprite_idle		= [s_enemy_spitter_walk_day,s_enemy_spitter_walk_night];
sprite_move		= [s_enemy_spitter_walk_day,s_enemy_spitter_walk_night];
sprite_shoot	= [s_enemy_spitter_spit_day,s_enemy_spitter_spit_night];

sprite_index = sprite_idle[night_index];

attack_timer_inc= 1;
launch_frame	= 1;
projectile		= o_enemy_spitter_glob;
shot_dir		= 0;
shot_spd		= 500;

drops			= [o_scrap_smol,o_scrap_mid,o_scrap_mid,noone];

// =====================
// STATS
// =====================
hp_max			= 5;
hp_cur			= hp_max;

// =====================
// MOVEMENT
// =====================
move_dir	= 0;
hspd_max_day	= 75;
hspd_max_night	= hspd_max_day*1.5;
hspd_max		= hspd_max_day;