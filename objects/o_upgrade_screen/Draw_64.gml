var width = 25;
var height = 15;
var endsx = floor(width/2);
var endsy = floor(height/2);
var startx = endsx*-1;
var starty = endsy*-1;
for (var i = startx; i <= endsx; i++) {
	for (var j = starty; j <= endsy; j++) {
		var x1		= global.cam_x-(width/2)+i*BLOCKSIZE;
		var y1		= global.cam_y-(height/2)+j*BLOCKSIZE;
		var part	= [1,1];
		if (i == startx) {
			if (j == starty) {
				part	= [0,0];
			}
			else if (j == endsy) {
				part	= [0,2];
			}
			else {
				part	= [0,1];
			}
		}
		else if (i == endsx) {
			if (j == endsy) {
				part	= [2,2];
			}
			else if (j == starty) {
				part	= [2,0];
			}
			else {
				part	= [2,1];
			}
		}
		else {
			if (j == starty) {
				part	= [1,0];
			}
			else if (j == endsy) {
				part	= [1,2];
			}
		}
		draw_sprite_part(s_menu_borders,0,part[0]*BLOCKSIZE,part[1]*BLOCKSIZE,BLOCKSIZE,BLOCKSIZE,x1,y1);
	}
}

draw_text(global.cam_x-floor(width/2)*BLOCKSIZE,global.cam_y-floor(height/2)*BLOCKSIZE,"Happerdashery");