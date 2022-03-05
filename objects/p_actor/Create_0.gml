// =====================
// STATES
// =====================
enum a_states {
	idle,
	moving,
	attacking,
}

state = a_states.idle;

// =====================
// MOVEMENT
// =====================
hspd		= 0;
hspd_max	= 500;
haccel		= 20;
hdecel		= 50;
vspd		= 0;
vspd_max	= 1200;
grav		= 50;
jspd		= 25;

// =====================
// COMBAT
// =====================
shot_timer		= 0;
shot_timer_max	= 3;
shot_timer_inc	= 10;

// =====================
// FLAGS
// =====================
on_floor	= true;
attacking	= false;