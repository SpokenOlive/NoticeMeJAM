event_inherited();

// ===========================
// BLOB 
// ===========================
ai_type			= ai_types.blob;
sprite_idle		= [s_enemy_blob_appear_day,s_enemy_blob_appear_night];
sprite_vanish	= [s_enemy_blob_vanish_day,s_enemy_blob_vanish_night];
sprite_move		= [s_enemy_blob_act_day,s_enemy_blob_act_night];
alert			= true;
e_state			= e_states.appear;
edge_aware		= false;

life_timer		= 8;
life_timer_inc	= 1;

sprite_index	= sprite_idle[night_index];

drops			= [o_scrap_smol,o_scrap_smol,noone];

// =====================
// STATS
// =====================
hp_max			= 2;
hp_cur			= hp_max;

// =====================
// MOVEMENT
// =====================
hspd_max_day	= 250;
hspd_max_night	= hspd_max_day*2;
hspd_max		= hspd_max_day;