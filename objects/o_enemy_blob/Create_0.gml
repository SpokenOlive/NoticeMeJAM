event_inherited();

// ===========================
// BLOB 
// ===========================
ai_type			= ai_types.goomba;
sprite_idle		= s_enemy_blob_appear;
sprite_move		= s_enemy_blob_act;
alert			= true;
e_state			= e_states.appear;

sprite_index = sprite_idle;

// =====================
// STATS
// =====================
hp_max = 3;
hp_cur = hp_max;

// =====================
// MOVEMENT
// =====================
move_dir	= 0;
hspd_max	= 250;