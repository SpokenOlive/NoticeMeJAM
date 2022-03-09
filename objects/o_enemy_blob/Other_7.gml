event_inherited();
if (e_state == e_states.appear) {
	e_state = e_states.approach;
	move_dir = face_dir;
	if (move_dir == 0) {
		move_dir = choose(1,-1);
	}
	hspd			= hspd_max * move_dir * global.time;
}