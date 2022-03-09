draw_set_font(global.font_32);
var gx1 = 0;
var gy1 = display_get_gui_height()-BLOCKSIZE*2;
var gx2 = gx1+display_get_gui_width();
var gy2 = gy1+BLOCKSIZE*2;

draw_rectangle_color(gx1,gy1,gx2,gy2,c_black,c_black,c_black,c_black,false);

draw_rectangle_color(gx1+BLOCKSIZE,gy1+BLOCKSIZE/2,gx1+BLOCKSIZE+hp_max*20,gy2-BLOCKSIZE/2,c_gray,c_gray,c_gray,c_gray,false);
draw_rectangle_color(gx1+BLOCKSIZE,gy1+BLOCKSIZE/2,gx1+BLOCKSIZE+hp_cur*20,gy2-BLOCKSIZE/2,c_red,c_red,c_red,c_red,false);

var gxx1 = display_get_gui_width()/2 - (magazine_max * 40)/2;
draw_rectangle_color(gxx1,gy1+BLOCKSIZE/2,gxx1+magazine_max*40,gy2-BLOCKSIZE/2,c_gray,c_gray,c_gray,c_gray,false);
draw_rectangle_color(gxx1,gy1+BLOCKSIZE/2,gxx1+magazine_cur*40,gy2-BLOCKSIZE/2,c_white,c_white,c_white,c_white,false);

//var gxx1 = display_get_gui_width() - BLOCKSIZE*10;
//draw_text(gxx1,gy1+BLOCKSIZE/2,"SCRAP: ");