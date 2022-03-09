event_inherited();

// ===========================
// SPITTER 
// ===========================
ai_type			= ai_types.spitter;
sprite_idle		= s_enemy_spitter_walk;
sprite_move		= s_enemy_spitter_walk;
sprite_shoot	= s_enemy_spitter_spit;

sprite_index = sprite_idle;

attack_timer_inc= 1;
launch_frame	= 1;
projectile		= o_enemy_spitter_glob;
shot_dir		= 0;
shot_spd		= 500;

// =====================
// STATS
// =====================
hp_max = 5;
hp_cur = hp_max;

// =====================
// MOVEMENT
// =====================
move_dir	= 0;
hspd_max	= 75;