event_inherited();

e_state = e_states.appear;
sprite_idle = s_enemy_blob_appear;
sprite_move = s_enemy_blob_act;

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