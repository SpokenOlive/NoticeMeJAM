draw_self();

switch (state) {
	case a_states.melee : 
		if (!have_shot && image_index >= melee_hit_frame) {
			var x1		= x;
			var y1		= y-melee_height-melee_depth/2;
			var x2		= x1 + melee_reach*image_xscale;
			var y2		= y1 + melee_depth;
			draw_set_alpha(.3);
			draw_rectangle_color(x1,y1,x2,y2,c_red,c_red,c_red,c_red,false);
			draw_set_alpha(1);
		}
	break;
}
