event_inherited();

// ===========================
// WALKER 
// ===========================
ai_type			= ai_types.brawler;
sprite_idle		= [s_enemy_walker_idle_day,s_enemy_walker_idle_night];
sprite_move		= [s_enemy_walker_walk_day,s_enemy_walker_walk_night];
sprite_melee	= [s_enemy_walker_melee_day,s_enemy_walker_melee_night];

sprite_index = sprite_idle[night_index];

attack_timer_inc= 10;
melee_distance	= 128;
melee_reach		= 160;
melee_height	= 96;
melee_depth		= 64;
melee_hit_frame	= 5;

drops			= [o_scrap_smol,o_scrap_smol,o_scrap_beeg,noone,];

// =====================
// STATS
// =====================
hp_max			= 9;
hp_cur			= hp_max;

// =====================
// MOVEMENT
// =====================
move_dir		= 0;
hspd_max_day	= 250;
hspd_max_night	= hspd_max_day*2;
hspd_max		= hspd_max_day;