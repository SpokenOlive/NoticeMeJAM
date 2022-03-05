// =====================
// APPLY MOVEMENT
// =====================
vspd += ((vspd < 0) ? grav : grav * 1.5)*global.time;

hspd = clamp(hspd, -hspd_max*global.time, hspd_max*global.time);
vspd = clamp(vspd, -vspd_max*global.time, vspd_max*global.time);

if (place_meeting(x+hspd,y,o_solid)) {
	var inc = sign(hspd);
	while(!place_meeting(x+inc,y,o_solid)) {
		x += inc;
	}
	hspd = 0;
}
x += hspd;

if (place_meeting(x,y+vspd,o_solid)) {
	var inc = sign(vspd);
	while(!place_meeting(x,y+inc,o_solid)) {
		y += inc;
	}
	vspd = 0;
}

y += vspd;

on_floor = place_meeting(x,y+1,o_solid);