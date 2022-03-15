if (invulnerable) {
	image_alpha = clamp(sin(invul_timer*3),.1,.7);
	invul_timer	-= global.time;
	if (invul_timer	<= 0) {
		invulnerable = false;
		invul_timer = invul_timer_max;
		image_alpha = 1;
	}
}

if (state == a_states.dead) {
	draw_text(x,y,death_timer);
}

draw_self();