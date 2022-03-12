draw_set_font(global.font_32);

var clock	= "<--" + string(floor(tod_timer)) + "-->";
var col		= c_white;
if (global.pause) {
	clock	= "<--GAME PAUSED-->";
}
else if (global.nighttime == 1) {
	clock	= "<--WARNING!-->";
	col		= c_red;
}
var x1 = display_get_gui_width()/2-string_width(clock)/2;
var y1 = BLOCKSIZE/2;
draw_text_color(x1,y1,clock,col,col,col,col,1);