event_inherited();
if (e_state == e_states.appear) {
	e_state = e_states.approach;
	move_dir = sign(ceil(o_player.x - x));
	if (move_dir == 0) {
		move_dir = choose(1,-1);
	}
	hspd			= hspd_max * move_dir * global.time;
}