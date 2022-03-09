if (state == a_states.melee || state == a_states.launch) {
	state		= a_states.idle;
	have_shot	= false;
}