event_inherited();

// ===========================
// WALKER 
// ===========================
ai_type			= ai_types.brawler;
sprite_idle		= s_enemy_walker_idle;
sprite_move		= s_enemy_walker_walk;
sprite_melee	= s_enemy_walker_melee;

sprite_index = sprite_idle;

attack_timer_inc= 10;
melee_distance	= 128;
melee_reach		= 160;
melee_height	= 96;
melee_depth		= 64;
melee_hit_frame	= 5;

// =====================
// STATS
// =====================
hp_max = 9;
hp_cur = hp_max;

// =====================
// MOVEMENT
// =====================
move_dir	= 0;
hspd_max	= 250;