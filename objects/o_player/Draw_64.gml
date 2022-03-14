// ==================================
// DRAW UPGRADE SCREEN
// ==================================
if (global.pause) {
	draw_set_font(global.font_16);
	
	if (upgrading) {
		draw_rectangle_color(0,0,10000,10000,c_white,c_white,c_white,c_white,false);
		draw_sprite(s_cave_background,0,0,0);
	}
	
	for (var i = 0; i < 14; i++) {
		for (var j = 0; j < array_length(stats)*2+8; j++) {
			draw_sprite(s_background_block,0,i*BLOCKSIZE,j*BLOCKSIZE);
		}
	}
	
	var x1 = BLOCKSIZE*2;
	var y1 = BLOCKSIZE;
	var col = 0;
	repeat(array_length(stats)+2) {
		var yoff = BLOCKSIZE*(col*2);
		if (col < array_length(stats)) {
			var stat = stats[col];
			var txt		= " ";
			switch (col) {
				case pStat.hp :			txt += string(hp_max);				break;
				case pStat.energy :		txt += string(blaster_charge_max);	break;
				case pStat.recharge :	txt += string(blaster_charge_inc);	break;
				case pStat.dmg :		txt += string(damage);				break;
			}
			draw_text(x1,y1+yoff+BLOCKSIZE/2-4,string(stat.name) + string(txt));
			draw_text(x1+(BLOCKSIZE*10)-(string_length(stat.cost)-1)*BLOCKSIZE,y1+yoff+BLOCKSIZE/2-4,stat.cost);
			draw_gui_bar(s_level_block,x1,y1+yoff+BLOCKSIZE,stat.lvl,stat.mx,BLOCKSIZE);
		}
		else if (upgrading) {
			var txt = "000";
			switch (col) {
				case 4: txt = "WAIT TILL MORNING"; break;
				case 5: txt = "LEAVE"; break;
			}
			draw_text(x1,y1+yoff+BLOCKSIZE,txt);
		}
		
		if (upgrading) {
			if (menu_index == col) {
				draw_sprite(s_menu_arrow,0,x1-BLOCKSIZE,y1+yoff+BLOCKSIZE);
			}
		}
		
		//draw_text(0,y1+yoff,col);
		
		col++;
	}
}

// ==================================
// TIME/WARNING/PAUSED
// ==================================
draw_set_font(global.font_32);
with (o_game) {
	var clock	= "<--" + string(floor(tod_timer)) + "-->";
	var col		= c_white;
	if (global.pause) {
		clock	= "<--GAME PAUSED-->";
	}
	else if (global.nighttime == 1) {
		clock	= "<--DANGER!-->";
		col		= c_red;
	}
	var x1 = display_get_gui_width()/2-string_width(clock)/2;
	var y1 = BLOCKSIZE/2;
	
	for (var i = -1; i < string_length(clock)+1; i++) {
		for (var j = -1; j < 2; j++) {
			draw_sprite_ext(s_background_block,0,x1+i*BLOCKSIZE,y1+j*BLOCKSIZE-BLOCKSIZE/2,1,1,0,c_white,.5);
		}
	}
	
	draw_text_color(x1,y1,clock,col,col,col,col,1);
}

// ==================================
// HUD
// ==================================
var HUDx1 = 0;
var HUDy1 = display_get_gui_height()-BLOCKSIZE*2;
var HUDx2 = HUDx1+display_get_gui_width();
var HUDy2 = HUDy1+BLOCKSIZE*2;
draw_rectangle_color(HUDx1,HUDy1,HUDx2,HUDy2,c_black,c_black,c_black,c_black,false);
draw_gui_bar(s_health_block,HUDx1+BLOCKSIZE,HUDy1+BLOCKSIZE/2,hp_cur,hp_max,BLOCKSIZE);

var bar_max		= stats[pStat.energy].base*40;
var bar_cur		= bar_max*(blaster_charge_cur/blaster_charge_max);
var HUDxx1		= display_get_gui_width()/2 - (bar_max/2);
draw_rectangle_color(HUDxx1,HUDy1+BLOCKSIZE/2,HUDxx1+bar_max,HUDy2-BLOCKSIZE/2,c_gray,c_gray,c_gray,c_gray,false);
draw_rectangle_color(HUDxx1,HUDy1+BLOCKSIZE/2,HUDxx1+bar_cur,HUDy2-BLOCKSIZE/2,c_white,c_white,c_white,c_white,false);

var HUDxx1		= display_get_gui_width() - BLOCKSIZE*10;

var scrap_txt	= "";
repeat(6 - string_length(scrap)) {
	scrap_txt	+= "0";
}
scrap_txt		+= string(scrap);

draw_text(HUDxx1,HUDy1+BLOCKSIZE/2,scrap_txt);