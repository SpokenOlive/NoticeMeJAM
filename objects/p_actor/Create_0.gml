// =====================
// STATES
// =====================
enum a_states {
	idle,
	moving,
	attacking,
	jumping,
	die,
	dead,
}

state = a_states.idle;

// =====================
// STATS
// =====================
hp_max = 10;
hp_cur = hp_max;

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


// =====================
// FUNCTIONS
// =====================
function actor_take_damage(dir,dmg,type) {
	hp_cur -= dmg;
	if (hp_cur <= 0) {
		hp_cur = 0;
		state = a_states.die;
	}
}