event_inherited();

// ===========================
// BLOB 
// ===========================
ai_type			= ai_types.blob;
sprite_idle		= s_enemy_blob_appear;
sprite_vanish	= s_enemy_blob_vanish;
sprite_move		= s_enemy_blob_act;
alert			= true;
e_state			= e_states.appear;

life_timer		= 8;
life_timer_inc	= 1;

sprite_index = sprite_idle;

// =====================
// STATS
// =====================
hp_max = 2;
hp_cur = hp_max;

// =====================
// MOVEMENT
// =====================
hspd_max	= 250;