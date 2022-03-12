if (invulnerable) {
	image_alpha = clamp(sin(invul_timer*3),.1,.7);
	invul_timer	-= global.time;
	if (invul_timer	<= 0) {
		invulnerable = false;
		invul_timer = true;
		image_alpha = 1;
	}
}
draw_self();
//draw_set_font(global.font)
//draw_sprite(mask_index,0,x,y);