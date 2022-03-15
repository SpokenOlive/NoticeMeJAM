event_inherited();

gravity_exempt	= true;
hp_max			= 3;
hp_cur			= hp_max;
my_solid		= instance_create_layer(bbox_left,bbox_top,"collision",o_solid);

with (my_solid) {
	image_xscale = 4;
	image_yscale = 4;
}